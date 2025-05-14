from pydantic import BaseModel

class Libro(BaseModel):
    book_id: int
    title: str
    author: str
    genre: str
    url_portada: str
