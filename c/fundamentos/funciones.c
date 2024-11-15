/*
  FUNCIONES
*/

#include <stdio.h>



// Funcion sin retorno ni paramateros
void nombrefuncion(){
  //CODE
};

//Funcion con retorno sin parametros
int obtenerNumero() {
  int iNumero;
  printf("Introduce un numero: ");
  scanf("%d", &iNumero);
  return iNumero;
};

// Funcion con parametros y retorno

int suma(int x, int y) {
  int iSuma = x + y;
  return iSuma;
}

int main (){
  //--> int result = obtenerNumero();
  //--> printf("%d", result);
  int result = suma(10, 20);
  printf("%d", result);
}
