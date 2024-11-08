#include <stdio.h>
#include <string.h>

struct jugadorBasquet {
  char nombre[25];
  char apellido[50];
  int edad;
  float altura;
};


int main(){
  struct jugadorBasquet base;

  strcpy(base.nombre, "Joan");
  strcpy(base.apellido, "Gomez");
  base.edad = 18;
  base.altura = 1.80;

  printf("%s", base.nombre);

  return 0;
}
