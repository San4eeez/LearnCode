import os
import psycopg2
from psycopg2 import sql, errors
from dotenv import load_dotenv
import logging

load_dotenv()

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

class Database:
    def __init__(self):
        self.connection = None
        self.cursor = None
        self._connect()

    def _connect(self):
        try:
            self.connection = psycopg2.connect(
                dbname=os.getenv('DB_NAME', 'learn_code'),
                user=os.getenv('DB_USER', 'postgres'),
                password=os.getenv('DB_PASSWORD', 'admin'),
                host=os.getenv('DB_HOST', 'localhost'),
                port=os.getenv('DB_PORT', '5432'),
                connect_timeout=5
            )
            self.cursor = self.connection.cursor()
            logger.info("Successfully connected to the database")
        except Exception as e:
            logger.error(f"Connection error: {e}")
            raise ConnectionError(f"Could not connect to database: {e}")

    def _reconnect(self):
        self.close()
        self._connect()

    def execute(self, query, params=None):
        try:
            self.cursor.execute(query, params or ())
            self.connection.commit()
            return True
        except (errors.OperationalError, errors.InterfaceError):
            logger.warning("Connection lost, attempting to reconnect...")
            self._reconnect()
            return self.execute(query, params)
        except errors.Error as e:
            logger.error(f"Database error: {e}")
            self.connection.rollback()
            return False

    def fetch_one(self, query, params=None):
        try:
            self.cursor.execute(query, params or ())
            return self.cursor.fetchone()
        except (errors.OperationalError, errors.InterfaceError):
            self._reconnect()
            return self.fetch_one(query, params)
        except errors.Error as e:
            logger.error(f"Fetch one error: {e}")
            return None

    def fetch_all(self, query, params=None):
        try:
            self.cursor.execute(query, params or ())
            return self.cursor.fetchall()
        except (errors.OperationalError, errors.InterfaceError):
            self._reconnect()
            return self.fetch_all(query, params)
        except errors.Error as e:
            logger.error(f"Fetch all error: {e}")
            return []

    def close(self):
        if self.cursor:
            self.cursor.close()
        if self.connection:
            self.connection.close()
        logger.info("Database connection closed")

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.close()

    def __del__(self):
        self.close()
