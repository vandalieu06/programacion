/*
  Pedir dos nuemros al usuario:
  Mostrar 5 y 3
  5 + 5 + 5 = 15
*/

#include <stdio.h>

int main(){

  int iNum1, iNum2 = 0, total;
  printf("Introduce dos numeros: ");
  scanf("%d", &iNum1);

  printf("Introduce dos numeros: ");
  scanf("%d", &iNum2);

  for(int i = 0; i < iNum2; i++){
    total += iNum1;
  }
  printf("> La multiplicacion de %d x %d es igual a: %d\n", iNum1, iNum2, total);

  return 0;
}