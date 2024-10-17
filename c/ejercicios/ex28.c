/*
  Pedir 3 numeros al usuarioç
  Guardar en un array
  Mostrar los tres nuemros
*/

#include <stdio.h>

int main (){

  int iNums[3];

  for (int i = 0; i <= 2; i ++){
    printf("Introduce el numero %d: ", i + 1);
    scanf("%d", &iNums[i]);
  }
  for (int i = 0; i <= 2; i ++){
    if (i != 2){
      printf("%d - ", iNums[i]);
    } else{
      printf("%d", iNums[i]);
    }
  }

  return 0;
}
