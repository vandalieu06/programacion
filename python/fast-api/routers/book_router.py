from fastapi import APIRouter
from ..database import books_db

router = APIRouter()

@router.get("/", tags=["books"])
async def get_books():
    return books_db.book_db
  
@router.get("/{book_id}", tags=["books"])
async def get_book(book_id: int):
  return books_db.book_db[book_id - 1]