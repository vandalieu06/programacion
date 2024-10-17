/*
  Pedir 10 numeros al usuario y mostrar
  por pantalla el nuemro introducido multiplicado por 100
*/ 

#include <stdio.h>

void fRecorido () {
  int i = 1;
  int iN;

  while (i <= 10) {
    printf("Introduce 1 valor: ");
    scanf("%d", &iN);
    printf("%d - Valor %d es igual a: %d\n", i, iN, iN * iN );
    i++;
  }
} 

void fRecoridoArray () {

  int iN1, iN2, iN3, iN4, iN5, iN6, iN7, iN8, iN9, iN10;
  printf("Introduce 10 valores: \n");
  scanf("%d %d %d %d %d %d %d %d %d %d", &iN1, &iN2, &iN3, &iN4, &iN5, &iN6, &iN7, &iN8, &iN9, &iN10);
  
  int numeros[] = {iN1, iN2, iN3, iN4, iN5, iN6, iN7, iN8, iN9, iN10};
  int i = 0;
  while (i < 10){
    printf("Valor %d es igual a : %d\n", numeros[i], numeros[i] * numeros[i] );
    i ++;
  }

}

int main () {
  
  fRecorido();

  return 0;
}
