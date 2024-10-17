/*
  Pedir un numero al usuario
  y hacer su factorial
*/

#include <stdio.h>

int main(){

  int iNum, total = 1;
  printf("Introduce dos numeros: ");
  scanf("%d", &iNum);

  for(int i = 1; i <= iNum; i++){
    total *= iNum;
    if( i < iNum){
      printf("%d x ", iNum);
    } else{
      printf("%d = ", iNum);
      printf("%d", total);
    }
  }

  printf("\n> La factorial de %d es igual a: %d\n", iNum, total);

  return 0;
}