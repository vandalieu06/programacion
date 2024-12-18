/*
  Haz un programa que quarde 10 numeros aleatorios de 0 a 100 en un array.
  Mostrar los numeros de incio a fin y luego de fin a inicio
*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void NumRandom(){
  srand((unsigned)time(NULL));
  printf("Numero Aleatorio: %d\n", rand() % (100 + 1));
  //rand = 4892749807209309; 100 => 99 + 1 = 1 a 100;
}

void NumsRandom(){
  srand((unsigned)time(NULL));
  int iNums[10];

  for (int i = 0; i < 10; i++) {
    iNums[i] = (rand() % 100) + 1;
  }

  printf("Ascendente: ");
  for (int i = 0; i < 10; i++) {
    printf("%d ", iNums[i]);
  }
  printf("\n");

  printf("Descendente: ");
  for (int i = 10; i > 0; i--) {
    printf("%d ", iNums[i - 1]);
  }
  printf("\n");
}

int main() {
  NumsRandom();

  NumRandom();

  return 0;
}
