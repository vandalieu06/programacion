/* 
  Pedir 2 numeros.
  Si son iguales mostrar que son iguales
  Si son difernetes, mostrar el mas grande
*/

#include <stdio.h>

int main () {
  
  int n1, n2;

  printf("Inserta dos valores: \n");
  printf("Valor 1: ");
  scanf("%d", &n1);

  printf("Valor 2: ");
  scanf("%d", &n2);

  if (n1 == n2){
    printf("- Los numeros %d y %d son iguales\n", n1, n2);
  } else {
    printf("- Los numeros %d y %d son diferentes\n", n1, n2);
    (n1 > n2) 
      ? printf("- El numeros mas grande es: %d\n", n1) 
      : printf("- El numeros mas grande es: %d\n", n2);
  }

  return 0;
}