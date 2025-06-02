from fastapi import APIRouter, Request, Depends
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from app.utils.database import Database

router = APIRouter()
templates = Jinja2Templates(directory="app/templates")

def get_db():
    db = Database()
    try:
        yield db
    finally:
        db.close()

@router.get("/language/{language_id}", response_class=HTMLResponse)
async def get_topics(request: Request, language_id: int, db: Database = Depends(get_db)):
    topics = db.fetch_all("SELECT id, title, description FROM topics WHERE language_id = %s", (language_id,))
    return templates.TemplateResponse("topics.html", {
        "request": request,
        "topics": topics,
        "language_id": language_id
    })
