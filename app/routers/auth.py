from fastapi import APIRouter, Request, Form, Depends, HTTPException, status
from fastapi.responses import HTMLResponse, RedirectResponse
from fastapi.templating import Jinja2Templates
from passlib.context import CryptContext
from app.utils.database import Database
from app.models import UserCreate, LoginData
from fastapi import Cookie

router = APIRouter()
templates = Jinja2Templates(directory="app/templates")
pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

def get_db():
    db = Database()
    try:
        yield db
    finally:
        db.close()

def get_flash_message(request: Request):
    return request.cookies.get("flash_message", "")

def set_flash_message(response, message: str):
    response.set_cookie(key="flash_message", value=message, max_age=5)  # 5 seconds validity

@router.get("/login", response_class=HTMLResponse)
async def login_page(request: Request):
    flash_message = get_flash_message(request)
    return templates.TemplateResponse("login.html", {"request": request, "flash_message": flash_message})

@router.post("/login", response_class=HTMLResponse)
async def login(request: Request, username: str = Form(...), password: str = Form(...), db: Database = Depends(get_db)):
    user = db.fetch_one("SELECT id, username, password_hash FROM users WHERE username = %s", (username,))
    if user and pwd_context.verify(password, user[2]):
        response = RedirectResponse(url="/main", status_code=status.HTTP_303_SEE_OTHER)
        response.set_cookie(key="user_id", value=str(user[0]), max_age=3600)  # Устанавливаем ID пользователя в cookie
        response.set_cookie(key="username", value=user[1], max_age=3600)  # Устанавливаем имя пользователя в cookie
        set_flash_message(response, "Welcome back!")
        return response
    response = templates.TemplateResponse("login.html", {"request": request, "error": "Invalid username or password"})
    set_flash_message(response, "Invalid username or password")
    return response


@router.get("/register", response_class=HTMLResponse)
async def register_page(request: Request):
    flash_message = get_flash_message(request)
    return templates.TemplateResponse("register.html", {"request": request, "flash_message": flash_message})

@router.post("/register", response_class=HTMLResponse)
async def register(request: Request, username: str = Form(...), email: str = Form(...), password: str = Form(...), db: Database = Depends(get_db)):
    if db.fetch_one("SELECT id FROM users WHERE username = %s OR email = %s", (username, email)):
        response = templates.TemplateResponse("register.html", {"request": request, "error": "User already exists"})
        set_flash_message(response, "User already exists")
        return response
    password_hash = pwd_context.hash(password)
    db.execute("INSERT INTO users (username, email, password_hash) VALUES (%s, %s, %s)", (username, email, password_hash))
    response = RedirectResponse(url="/login", status_code=status.HTTP_303_SEE_OTHER)
    set_flash_message(response, "Registration successful! Please login.")
    return response

@router.get("/logout", response_class=RedirectResponse)
async def logout(request: Request):
    response = RedirectResponse(url="/")
    response.delete_cookie("user_id")
    response.delete_cookie("username")
    set_flash_message(response, "You have logged out successfully.")
    return response