/*
  Generar 20 numeros aleatorios entre 1 y 100
  Luego mostrar cueantos perteenecen a cada rango
  - 1 a 25
  - 26 a 50
  - 50 a 75
  - 76 a 100
*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main () {
  srand((unsigned)time(NULL));
  int iRangos[4] = {0, 0, 0, 0};
  int iNums[20];


  for (int i = 0; i < 20; i++){
    iNums[i] = rand() % 100 + 1;

    if (iNums[i] > 0 && iNums[i] <= 25){
      iRangos[0]++;
    } else if (iNums[i] >= 26 && iNums[i] <= 50){
      iRangos[1]++;
    } else if (iNums[i] >= 51 && iNums[i] <= 75){
      iRangos[2]++;
    } else if (iNums[i] >= 76 && iNums[i] <= 100){
      iRangos[3]++;
    }
  }
  for (int j = 0; j < 4; j++) {
    printf("El rango %d tiene %d numeros dentro del rango.\n", j + 1, iRangos[j]);
  }

  return 0;
}
