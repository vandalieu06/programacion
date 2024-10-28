#include <stdio.h>
#include <string.h>

int main (){
  char texto[50] = "Hola";
  char texto2[50];
  printf("%s\n", texto);

  //OBTENEMOS TAMAÑO DE LA CADENA
  printf("%d\n", (int)strlen(texto));

  //COPIAMOS EL VALOR 2 AL VALOR 1
  strcpy(texto2, texto);
  printf("%s\n", texto2);

  //COMPROVAMOS QUE CHAR ES MAS GRANDE
  // 0 = igual; <0 VALOR 1 es mas pequeño; >0 VALOR 1 es mas grande;
  printf("%d\n", strcmp(texto, texto2));

  //CONCATENAMOS EL VALOR 2 AL VALOR 1
  strcat(texto2, texto);
  printf("%s\n", texto2);

  return 0;
}
