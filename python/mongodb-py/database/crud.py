from zoneinfo import reset_tzpath

from database import connection
from .model import curso_model

class Cursos:
  def __init__(self, db_name: str = "act25", coll_name: str = "cursos"):
    self.db_name = db_name
    self.coll_name = coll_name

  def get_all(self):
    try:
      client = connection.create_connection()
      query = {"_id": 0}
      cursos = client[self.db_name][self.coll_name].find({}, query)
      return cursos
    except Exception as e:
      raise Exception("Error: ", e)

  def get_all_limit(self, limit: int = 3):
    try:
      client = connection.create_connection()
      parameter = {"_id": 0}
      results = client[self.db_name][self.coll_name].find({}, parameter).limit(limit)
      return results
    except Exception as e:
      raise Exception("Error: ", e)

  def add_curso(self, codi: str, nom: str, hores: int, professor: str):
    try:
      client = connection.create_connection()
      new_user = curso_model.Curso(codi, nom, hores, professor)
      if all(hasattr(new_user, attr) for attr in ["codi", "nom", "hores", "professor"]):
        result = client[self.db_name][self.coll_name].insert_one(new_user.to_dict())
        return new_user.to_dict()
      else:
        print("Datos incorrectos")
    except Exception as e:
      raise Exception("Error: ", e)
