from pydantic import BaseModel

class User(BaseModel):
    user_uid: int
    first_name: str
    last_name: str
