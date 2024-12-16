/*
  Realizar un programa que pida fila y columnas.
  Mostrar asteriticos para formar la figura:

  4 y 3
  ***
  ***
  ***
  ***
*/

#include <stdio.h>

int main (){

  int iFila, iColumna;

  printf("Introduce fila: ");
  scanf("%d", &iFila);

  printf("Introduce columna: ");
  scanf("%d", &iColumna);

  printf("Figura \n");
  printf("---------\n");
  for (int i = 0; i < iColumna; i++){
    for(int i2 = 0; i2 < iFila; i2++){
      printf("*");
    }
    printf("\n");
  }

  return 0;
}
