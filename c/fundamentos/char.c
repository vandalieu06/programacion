/*
  ARRAY DE CARACTERES
*/

#include <stdio.h>
#include <string.h> //Libreraia para metodos con string

int main () {

  char cStr[5] = {'h', 'o', 'l', 'a', '\0'};
  char cStr2[5] = "hola";
  strcpy(cStr2, "lala"); // Assignar o reassiganr con o sin espacios
  return 0;
}
