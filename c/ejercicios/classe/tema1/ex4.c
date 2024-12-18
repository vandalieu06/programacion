/*
  PAsa tres valores e indica el mas grande
  y el mas pequeño.
*/

#include <stdio.h>

int main (){
  int iA, iB, iC;
  
  printf("Introduce tres valores: \n");
  
  printf("Valor 1: ");
  scanf("%d", &iA);

  printf("Valor 2: ");
  scanf("%d", &iB);

  printf("Valor 3: ");
  scanf("%d", &iC);

  // COMIENZA LA COMPROVACION
  int max = iA; 
  int min = iA;

  // MAYOR
  if (iB > max) {
    max = iB;
  }
  if (iC > max) {
    max = iC;
  }

  // MENOR
  if (iB < min) {
    min = iB;
  }
  if (iC < min) {
    min = iC;
  }

  // RESULTADO

  printf("El mas pequeño es %d\n", min);
  printf("El mas grande es %d\n", max);
  

  return 0;

}