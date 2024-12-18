/*
  Pedir numeros positivos al usuario cuando el 
  introduca uno negativo finalizael programa
*/

#include <stdio.h>

int main(){
  printf("Introducde numeros positivos\n");

  int iNum;
  float iPromedio = 0;
  int iLimitador = 2;

  for (int i = 1; i < iLimitador; i++) {
    printf("%d-Introduce un valor: ", i);
    scanf("%d", &iNum);
    
    if (iNum % 2 == 0){
      iPromedio += iNum;
      iLimitador++;
    } else{
      iLimitador = 0;
      int iReal = i - 1;
      printf("> El valor pormedio de los numeros introducidoes es: %.2f\n", iPromedio / iReal);
      printf("%.2f, %d\n", iPromedio, iReal);
    }
  }
  
  return 0;
}