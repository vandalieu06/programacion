/*
  Pedir al usuario una nota nuemrica y
  mostrar el numero y la letra

  0-4 (INS)
  5 (SUF)
  6 (BE)
  7-8 (NOT)
  9-10 (EX)
*/

#include <stdio.h>

int main () {

  int iNota; 
  
  printf("BIENVENIDO\n");
  printf("Introduce tu nota: ");
  scanf("%d", &iNota);

  switch (iNota) {
    case 0 ... 4:
      printf("Tienes un %d (Insuficiente)\n", iNota);
      break;
    case 5 :
      printf("Tienes un %d (Suficiente)\n", iNota);
      break;
    case 6:
      printf("Tienes un %d (Be)\n", iNota);
      break;
    case 7 ... 8:
      printf("Tienes un %d (Notable)\n", iNota);
      break;  
    case 9 ... 10:
      printf("Tienes un %d (Excelente)\n", iNota);
      break;  
    default:
      printf("Introduce un valor del 0 al 10.\n");
  }

  return 0;
}