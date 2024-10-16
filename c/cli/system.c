#include <stdio.h>
#include <stdlib.h> //https://academiasanroque.com/profundizando-en-stdlib-h-la-biblioteca-estandar-de-utilidades-en-c/
#include <string.h>
#include <time.h>


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

void numeroAleatorio(){
  srand(time(NULL)); // Establecer que el numero aleatorio dse genrara en base al tiempo actual
  int iNum = 0;
  int iRango = 0;
  printf("Hasta que numero quiere el aleatorio: ");
  scanf("%d", &iNum);
  printf("A partir de que numero quieres comenzar: ");
  scanf("%d", &iRango);

  int iRandom = rand() % iNum + iRango;
  // rand() --> 687678 (numero generado a partir de algo como el tiempo actual o de la creacion de UNIX)
  // iNum --> 100 (Rango de 0 al 99, normalmente se pone 100 + 1 para que el rango sea de 0 a 100)
  // iRango  --> Donde comenzara, por ejepmplo quiero comenzar en el numero de 20 en 
  // caso lo que pasara es que el nuemro btenido vaya de 20 a 119.

  printf("%d\n", iRandom);
}

int main () {
  int iOpcion;
  printf("1. Listar directorio\n");
  printf("2. Ping a google.es\n");
  printf("3. Numero aleatorio\n");
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
  case 3:
    numeroAleatorio();
    break;
  default:
    printf("> scoge una opcion valida!!");
    break;
  }

  //system("cls");

  return 0;
}