/*
  Numeros Aleatorios
*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main (){

  srand((unsigned)time(NULL));
  int iRand;
  int iDado[5] = {0, 0, 0, 0, 0};

  for(int i = 0; i < 5; i++){
    iRand = (rand() % 6) + 1;
    iDado[i] = iRand;
  }

  for (int i = 0; i < 5; i++) {
    printf("La cara del dado %d es igual a %d\n", i + 1, iDado[i]);
  }

  return 0;
}
