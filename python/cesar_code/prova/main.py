
def Saludo (nombre, edad = 5):
  print(f'Hola {nombre} con {edad} años!') #f al principio es para activar la lectura de varaiables dentro del string con los {namrVariable}

def ObtenerDatos():
  nombreUsuario = input("Ingrese su nombre: ")
  edadUsuario = int(input("Ingrese su edad: "))
  return nombreUsuario, edadUsuario


def main():
  datos = ObtenerDatos()
  nombreUsuario, edadUsuario = datos
  Saludo(nombreUsuario, edadUsuario)

if __name__ == "__main__":
  main()