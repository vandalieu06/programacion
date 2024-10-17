#include <stdio.h>


int main () {
  
  /*
    %c --> caracter
    %d --> numero entero
    %i --> nuemro entero
    %f --> numero en float (decimales)
    %s --> cadena de caracteres
    %x/X --> numeros hexadecimales
  */
  
  int iResultat;
  iResultat = (int)2.5 + (int)2.8;
  printf("Resultat: %d\n", iResultat);

  return 0;
}