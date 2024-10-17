/*
  Pedir al usuario 25 numeros y mostrar si 
  es par/impar en cada iteracion
*/

#include <stdio.h>

void fRecoridoWhile () {
  int i = 1;
  int iNumero;

  while (i <= 25) {
    printf("Introduce 1 valor: ");
    scanf("%d", &iNumero);

    (iNumero % 2 == 0) 
      ? printf("%d - El numero %d es par\n", i, iNumero)
      : printf("%d - El numero %d es impar\n", i, iNumero);

    i++;
  }
}

void fRecoridoFor () {
  int iNumero;

  for (int i = 1; i <= 25; i++) {
    printf("Introduce 1 valor: ");
    scanf("%d", &iNumero);

    (iNumero % 2 == 0) 
      ? printf("%d - El numero %d es par\n", i, iNumero)
      : printf("%d - El numero %d es impar\n", i, iNumero);
 
  }
}

int main () {
  fRecoridoWhile();
  return 0;
}