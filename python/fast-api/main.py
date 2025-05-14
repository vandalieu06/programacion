from fastapi import FastAPI
from pydantic import BaseModel
from .routers import book_router, user_router

app = FastAPI()

# Rutas
@app.get("/")
async def home_page():
    return {"home": "hello world!"}

app.include_router(book_router.router, prefix="/books")
app.include_router(user_router.router, prefix="/users")
