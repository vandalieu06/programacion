/*
  Crear un programa que tiene la cadena hola y mostrar por pantalla aloh
*/

#include <stdio.h>

int main (){

  char cNombre[5] = "Hola";
  for (int i = 4; i >= 0; i--) {
    printf("%c", cNombre[i]);
  }
  printf("\n");
  return 0;
}
