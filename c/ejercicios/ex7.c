/*
  Has un menu de opciones i segun la opcion escogida devolver
  la operacion correpondiente.
  1. Suma
  2. Resta
  3. Division
  4. Multiplicacion

*/

#include <stdio.h>

int main () {
  
  int iOpcion, iA, iB;

  printf("OPCIONES\n");
  printf("1 - Sumar\t");
  printf("2 - Restar\t");
  printf("3 - Multiplicar\t\t");
  printf("4 - Dividir\n");

  printf("Escoge una opcione: ");
  scanf("%d", &iOpcion);

  if (iOpcion >= 5) {
    printf("La opcion escogida no existe\n");
  } else { 
    printf("Introduce dos valores: \n");
    printf("Valor 1: ");
    scanf("%d", &iA);

    printf("Valor 2: ");
    scanf("%d", &iB);
  }

  if (iOpcion == 1) {
    printf("La suma de los dos valores es: %d\n", iA + iB);
  }
  if (iOpcion == 2) {
    printf("La suma de los dos valores es: %d\n", iA - iB);
  }
  if (iOpcion == 3) {
    printf("La suma de los dos valores es: %d\n", iA * iB);
  }
  if (iOpcion == 4) {
    printf("La suma de los dos valores es: %.2f\n", (float)iA / iB);
  }

  return 0;
}