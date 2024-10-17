/*
  Introduce un numero i di si es
  positivo o negativo.
*/

#include <stdio.h>

int main (){
  int iX;
  
  printf("Introduce un valor: ");
  scanf("%d", &iX);

  if (iX >= 0){
    printf("El numero %d es positivo\n", iX);
  } else if (iX < 0){
    printf("El numero %d es negativo\n", iX);
  }
  
  return 0;

}