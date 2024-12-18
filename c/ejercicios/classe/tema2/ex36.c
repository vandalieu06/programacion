/*
  Crera una matrix de 3 x 3 con numeros aleatorios
  Mostrar el ontenido de la matriz
*/

#include <time.h>
#include <stdio.h>
#include <stdlib.h>

int main(){
  srand((unsigned)time(NULL));
  //Array Bidiomensionales
  int iMatrix[3][3] = {0,0,0,0,0,0,0,0,0}; //Como es de 3 elementos por fila cuanto llege al numero 3 slata de linea
  int iRandom;
  for (int i = 0; i < 3; i++){
    for (int j = 0; j < 3; j++){
      iRandom = rand() % 101;
      iMatrix[i][j] = iRandom;
      printf("%d ", iMatrix[i][j]);
    }
    printf("\n");
  }

  return 0;
}
