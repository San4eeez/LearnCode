from fastapi import APIRouter, Request, Depends, status
from fastapi.responses import HTMLResponse, RedirectResponse
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

@router.get("/main", response_class=HTMLResponse)
async def main_page(request: Request, db: Database = Depends(get_db)):
    user_id = request.cookies.get("user_id")
    if not user_id:
        return RedirectResponse(url="/login", status_code=status.HTTP_303_SEE_OTHER)
    languages = db.fetch_all("SELECT id, name FROM programming_languages ORDER BY name")
    return templates.TemplateResponse("main.html", {"request": request, "languages": languages})
