/*
  Generar 50 numeros aleatorios entre 1 y 100.
  Mostrar por pantalla la media de los numeros generados
*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main (){
  srand((unsigned)time(NULL));
  int iNums[50];
  int iTotal;
  for (int i = 0; i < 50; i++){
    iNums[i] = rand() % 100 + 1;
    iTotal += iNums[i];
  }
  printf("La media es de: %d\n", iTotal / 50);


  return 0;
}
