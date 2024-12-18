/*
  Pedir al usuario un numero y que lo muesrtre del reves 
*/
#include <stdio.h>

int main (){
  int iNum;
  printf("Introduce un valor: ");
  scanf("%d", &iNum);

//Hecho por chatgpt
  int iInvertido = 0;
  while (iNum != 0) {
    int digito = iNum % 10; // Obtener el último dígito
    iInvertido = iInvertido * 10 + digito; // Agregar el dígito al número invertido
    iNum /= 10; // Eliminar el último dígito del número original
  }

  printf("El Numero invertido es: %d\n", iInvertido);
  return 0;
}