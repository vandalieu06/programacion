/*
  Realizar un prgrama
  que pida un numero al ausuario y realice su tabla
  de multiplicaion

  Introduce numero: 4
  4 x 1 = 4
  ...
*/

#include <stdio.h>

int main (){

  int iTotal;

  for (int i = 1; i <= 10; i++) {
    printf("Tabla del %d\n", i);
    printf("-----------------\n");

    for (int i2 = 0; i2 <= 10; i2++){
      iTotal = i * i2;
      printf("| %d x %d = %d\t|\n", i, i2, iTotal);
    }
    printf("-----------------\n");

    printf("\n");
  }

  return 0;
}
