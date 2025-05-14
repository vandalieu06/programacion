from database import crud
import json

cursos = crud.Cursos()
results = cursos.get_all()
col = []
for curso in results:
  col.append(curso)

print(json.dumps(col, indent=2))

result = cursos.add_curso("ABC1234", "Ofimatica", 487, "Jhonny C.")
print(cursos)