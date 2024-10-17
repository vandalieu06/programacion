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

  float iNota; 
  
  printf("BIENVENIDO\n");
  printf("Introduce tu nota: ");
  scanf("%f", &iNota);

  if (iNota < 5) {
    printf("Tienes un %.2f (Insuficiente)\n", iNota);
  }else if (iNota >= 5  && iNota <6){
    printf("Tienes un %.2f (Suficiente)\n", iNota);
  }else if (iNota >= 6 && iNota < 7) {
    printf("Tienes un %.2f (Be)\n", iNota);
  }else if (iNota >= 7 && iNota < 9) {
    printf("Tienes un %.2f (Notable)\n", iNota);
  }else if (iNota >=9 && iNota <= 10){
    printf("Tienes un %.2f (Excelente)\n", iNota);
  }else{
    printf("Introduce un valor del 0 al 10.\n");
  }

  return 0;
}