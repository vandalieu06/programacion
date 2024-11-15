/*
  Pedir 3 numeros
  Mostrar un menu:
  1. Mostar numero ordenados ascendente
  2. Mostar numero ordenados descendente
*/

#include <stdio.h>

int main () {

  int iOpcion, iA, iB, iC;

  printf("OPCIONES\n");
  printf("1 - Asendente\t");
  printf("2 - Descendente\n");

  printf("Escoge una opcion: ");
  scanf("%d", &iOpcion);

  if (iOpcion >= 3 || iOpcion == 0) {
    printf("La opcion escogida no existe\n");
  } else {  
    printf("Introduce tres valores: \n");
    printf("Valor 1: ");
    scanf("%d", &iA);

    printf("Valor 2: ");
    scanf("%d", &iB);

    printf("Valor 3: ");
    scanf("%d", &iC);
  }

  //FUNCION
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

  // MEDIANO
  int middle = iA + iB + iC - max - min;

  if (iOpcion == 1){
    printf("El numero mayor es %d, el mediano %d y el pequeño %d.\n", max, middle, min);
  }
  if (iOpcion == 2){
    printf("El numero menor es %d, el mediano %d y el mayor %d.\n", min, middle, max);
  }

  return 0;
}