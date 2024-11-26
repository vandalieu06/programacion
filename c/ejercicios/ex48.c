/*
  Crear funcion para intercambiar dos numeros
  int intercambiar (a, b);
  a = 5;
  b = 6;
  -->  a = 6, b= 5
*/

#include <stdio.h>
void intercambier (int a, int b){
  int tmp = a;
  a = b;
  b = tmp;


}

int main (){
  int a = 5;
  int b = 6;
  printf("a = %d, b = %d\n", a, b);
  intercambier(a, b);
  printf("a = %d, b = %d", a, b);

  return 0;
}
