#include <stdio.h>
#include <stdlib.h> //https://academiasanroque.com/profundizando-en-stdlib-h-la-biblioteca-estandar-de-utilidades-en-c/
#include <string.h>


void listarCarpetas(){
  char command[60] = "dir ";
  char cParametro[100] ;
  printf("Que carpeta queires listar: "); 
  scanf("%s", &cParametro);
  strcat(command, cParametro);
  system(command);
}

void comprovarConnexion(){
  char command[50] = "ping -n 5 8.8.8.8";
  system(command);
}


int main () {
  int iOpcion;
  printf("1. Listar directorio\n");
  printf("2. Ping a google.es\n");
  printf("Escoge una opcion: ");
  scanf("%d", &iOpcion);

  switch (iOpcion)
  {
  case 1:
    listarCarpetas();
    break;
  case 2: 
    comprovarConnexion();
    break;
  default:
    printf(">Escoge una opcion valida!!");
    break;
  }

  return 0;
}