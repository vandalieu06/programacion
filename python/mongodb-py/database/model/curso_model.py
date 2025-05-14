class Curso:
  def __init__(self, codi: str, nom: str, hores: int, professor: str):
    self.codi = codi
    self.nom = nom
    self.hores = hores
    self.professor = professor

  def to_dict(self):
    return {
      "codi": self.codi,
      "nom": self.nom,
      "hores": self.hores,
      "professor": self.professor
    }