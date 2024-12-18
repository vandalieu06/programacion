/*
  Crear una  matriz del 10 x 10 con numeros aleatorios
  - Pedir al usuario un numero del 0 al 9
  - Sumar todos los numeros de la fila seleccionada
  - Pedir al usuario otro numero entre el 0 y el 9
  - Sumar todos los nuemros de la columna seleccionada
*/

#include <stdio.h>
#include <time.h>
#include <stdlib.h>


int main () {
  srand((unsigned)time(NULL));
  int iOpcion;
  int iNum;

  printf("Opciones\n");
  printf("1. Sumar filas\t");
  printf("2. Sumar columnas\n");
  printf("> Escoge una opcion: ");
  scanf("%d", &iOpcion);
  printf("> Dame un numero del 0 al 9: ");
  scanf("%d", &iNum);

  //MATRIZ
  printf("Generando Matriz...\n");
  int iMatriz[10][10];
  int iRandom;
  for (int i = 0; i < 10; i++){
    for (int j = 0; j < 10; j++){
      iRandom = rand() % 2;
      iMatriz[i][j] = iRandom;
      printf("%d ", iMatriz[i][j]);
    }
    printf("\n");
  }

  //RESULTADO
  printf("\nObteniendo Resultado...\n");
  int iSuma = 0;

  if (iOpcion == 1){ //FILA
    for (int j = 0; j < 10; j++){
      iSuma += iMatriz[iNum][j];
    }
  } else if (iOpcion == 2){ //COLUMNAS
    for (int i = 0; i < 10; i++){
      iSuma += iMatriz[i][iNum];
    }
  } else {
    printf("> La opcion escogida no es valida, vuelve a intentar introduciendo una opcion valida.");
  }
  printf("%d\n", iSuma);

  return 0;
}
