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

  int iNum, iTotal;
  printf("Introduce un numero: ");
  scanf("%d", &iNum);

  int max;
  printf("Numero de tabla: ");
  scanf("%d", &max);

  for (int i = 0; i <=max; i++) {
    iTotal = iNum * i;
    printf("> %d x %d = %d\n", iNum, i, iTotal);
  }

  return 0;
}
