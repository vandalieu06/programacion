/*
  Pide 2 numeros
  Muetsra menu:
    Suma, Resta, Multiplicacion, Division
  Escoge una opcion:
    Pedir: + char (caracter) (%c)
  Realiza opcion
  Switch
*/

#include <stdio.h>

int main () {

  char iOpcion;
  int iA, iB; 

  printf("MENU\n");
  printf("Suma (+)\t");
  printf("Resta (-)\t");
  printf("Multiplicacion (*)\t");
  printf("Division (/)\t");
  printf("\nIntroduce el caracter de la operacion: ");
  scanf("%c", &iOpcion);
  printf("Introduce dos valores: \n");
  printf("Valor 1: ");
  scanf("%d", &iA);
  printf("Valor 2: ");
  scanf("%d", &iB);


  switch (iOpcion) {
    case '+':
      printf("La suma es: %d\n", iA + iB);
      break;
    case '-':
      printf("La resta es: %d\n", iA - iB);
      break;
    case '*':
      printf("La multiplicacion es: %d\n", iA * iB);
      break;
    case '/':
      printf("La division es: %.2f\n", (float)iA / iB);
      break;
    default:
      printf("La opcion escogida no se encuentra, escoge otra por favor");
  }

  return 0;
}