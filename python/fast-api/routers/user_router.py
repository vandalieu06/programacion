from fastapi import APIRouter
from ..models import user_model
from ..database import users_db

router = APIRouter()

@router.get("/", tags=["users"])
async def read_users():
    return users_db.usuarios

@router.post("/", tags=["users"])
async def create_user(user: user_model.User):
    usuarios.append(user)
    return user

@router.get("/me", tags=["users"])
async def read_user_me():
    return {"user_id": "the current user"}


@router.get("/{user_id}", tags=["users"])
async def read_user(user_id: int, password: str = "admin1234"):
    return {"user_id": user_id, "password": password}


