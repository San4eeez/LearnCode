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


@router.get("/topic/{topic_id}", response_class=HTMLResponse)
async def get_lessons(request: Request, topic_id: int, db: Database = Depends(get_db)):
    # Получаем тему, чтобы узнать language_id и имя темы
    topic = db.fetch_one("SELECT title, language_id FROM topics WHERE id = %s", (topic_id,))

    if not topic:
        return HTMLResponse(content="Тема не найдена", status_code=404)

    lessons = db.fetch_all(
        "SELECT title, content, example_code, difficulty FROM lessons WHERE topic_id = %s",
        (topic_id,)
    )

    return templates.TemplateResponse("lessons.html", {
        "request": request,
        "lessons": lessons,
        "topic_name": topic[0],  # name
        "language_id": topic[1],  # language_id
    })

