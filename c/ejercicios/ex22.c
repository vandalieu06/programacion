/*
  Pedir numero al usuario que este entre 1 y 10,
  sino esta vuleve apedir un numero.
*/

#include <stdio.h>
int main() {
  
  int iNum = 0;
  int i = 0;
  
  do{
    if (i == 0){
      printf("> Introduce un numero del 1 al 10: ");
    } else{
      printf("> Vuelve a introducir un numero del 1 al 10: ");
    }
    scanf("%d", &iNum);
    i++;
  }while(iNum < 0 || iNum > 10);

  printf("En %d intentos has logrado introducir el numero correcto: %d\n", i - 1, iNum);
  return 0;
}