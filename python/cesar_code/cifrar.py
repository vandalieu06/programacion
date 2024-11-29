alfabeto = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
mensaje = "PALABRA_SIN_CIFRADO"
clave = 3
cifrado = ""

for letra in mensaje.upper():
  if letra in alfabeto:
    indice = alfabeto.find(letra)
    indice += clave

    if indice >= 26:
      indice -= 26
    cifrado += alfabeto[indice]
  else :
    cifrado += letra

print(cifrado) 