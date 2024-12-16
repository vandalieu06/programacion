/*
  Introduce dos valores y indica 
  si son divisibles o no 
*/

#include <stdio.h>

int main (){
  int iX, iY;
  
  printf("Introduce dos valores: \n");
  
  printf("Valor 1: ");
  scanf("%d", &iX);

  printf("Valor 2: ");
  scanf("%d", &iY);

  (iX % iY > 0) ? printf("No es divisible\n") : printf("Es divisible\n");
  
  return 0;

}