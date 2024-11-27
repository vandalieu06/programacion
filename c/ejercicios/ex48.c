/*
  Crear funcion para intercambiar dos numeros
  int intercambiar (a, b);
  a = 5;
  b = 6;
  -->  a = 6, b= 5
*/

#include <stdio.h>
void intercambierSinReferencia (int a, int b){
  int tmp = a;
  a = b;
  b = tmp;
}
void intercambiar(int *a, int *b){
  int tmp = *a;
  *a = *b;
  *b = tmp;
}

int main (){
  int a = 5;
  int b = 6;
  printf("Solucion 1: a = %d, b = %d\n", a, b);
  //intercambier(a, b); - Sin referencia no cambia los valores
  intercambiar(&a, &b);
  printf("Solucion 2: a = %d, b = %d\n", a, b);

  return 0;
}
