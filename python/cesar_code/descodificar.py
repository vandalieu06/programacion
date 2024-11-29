alfabeto = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
cifrado = "KROD PXQGR"
clave = 3
mensaje = ""

for letra in cifrado.upper():
  if letra in alfabeto:
    indice = alfabeto.find(letra)
    indice -= clave
    if indice < 0:
      indice += 26
    mensaje += alfabeto[indice]
  else :
    mensaje += letra

print(mensaje)