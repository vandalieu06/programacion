/*
  Introduce dos numeros y haz las quatro operaciones
  con estos: suma, resta, multiiplicacion i division.
*/

#include <stdio.h>

int main (){
  int iX;
  int iY;
  
  printf("Introduce dos valores\n");

  printf("Valor 1: ");
  scanf("%d", &iX);

  printf("Valor 2: ");
  scanf("%d", &iY);

  printf("La suma es: %d \n", iX + iY);
  printf("La resta es: %d \n", iX - iY);
  printf("La multiplicacion es: %d \n", iX * iY);
  printf("La division es: %.2f \n", (float)iX / iY);
  
  /*
    EXPLICACION - %.2f
    
    . --> declara que sera un decimal con precision
    2 --> nuemro de digitos que se mostraran despues de la coma
    f --> indica que el valor es un float 
   */
  
  return 0;

}