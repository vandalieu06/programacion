/* 
  Pedir al usuario 10 numeros y mostrar el 
  finalizar el mas grande y el mas pequeño
*/

#include <stdio.h>

int main () {

  int iNum;
  int max, min;
  int i = 1;
  while( i <= 10){
    printf("Introduce un valor: ");
    scanf("%d", &iNum);
    
    // Asiganr por primera vez el valor
    if (i == 1){
      max = iNum;
      min = iNum;
    }
  
    // MAYOR
    if (iNum > max) {
      max = iNum;
    }

    //MENOR 
    if (iNum < min){
      min = iNum;
    }

    // Imprimir mensaje
    if (i == 10 ){
      printf("El mas pequeño es %d\n", min);
      printf("El mas grande es %d\n", max);  
    }

    i++;
  }

}