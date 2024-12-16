/*
  Pedir al usuario un numero y mostrrar por la pantalla
  cuantos digitos tiene.
*/

#include <stdio.h>

int main(){

  int iNum;
  int i = 0;

  printf("Introduce un valor: ");
  scanf("%d", &iNum);

  do {
    iNum = iNum / 10;
    i++;
  }while (iNum != 0);

  printf("> El numero introducido tiene un total de: %d digitos.\n", i);

  return 0;
}
