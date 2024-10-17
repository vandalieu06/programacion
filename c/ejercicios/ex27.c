/*
  Pedimos un numero al usuario y mostramos
  la siguiente figura.

  Introduce un numero: 5
  1
  12
  123
  12345

  ***Añadir opciones desendente o asscendete
*/
#include <stdio.h>

int main(){

  int iNum, iOpcion;


  printf("Opciones\n");
  printf("1 - Ascendente\n");
  printf("2 - Descendente\n");
  printf("> Introduce una opcion: ");
  scanf("%d", &iOpcion);

  if (iOpcion != 0 && iOpcion <= 2 ){
    printf("> Introduce un valor: ");
    scanf("%d",&iNum);
  }

  if (iOpcion == 1){
    for(int i = 1; i <= iNum; i++){
      for(int i2 = 1; i2 <= i; i2++){
        printf("%d", i2);
      }
      printf("\n");
    }
  }

  if(iOpcion == 2){
    for(int i = iNum; i >= 1; i--){
      for(int i2 = 1; i2 <= i; i2++){
        printf("%d", i2);
      }
      printf("\n");
    }

  return 0;
  }






  return 0;
}
