/*
  Crear una funcion que caclule el doble y el triple 
  de un numero y devuelva el resultado mediante paso 
  por referencia.
*/

#include <stdio.h>


int obtenerNumero (){
  int iNum = 0;
  printf("Introduce un numeros\n");
  printf("Numero: ");
  scanf("%d", &iNum);
  return iNum;
}

void calcularDobleTriple (int *a, int *iDoble, int *iTriple){
  *iDoble = *a * 2;
  *iTriple = *a * 3;
}

int main (){

  int iNum = obtenerNumero();

  int iDoble = 0, iTriple = 0;
  calcularDobleTriple(&iNum, &iDoble, &iTriple);
  printf("El doble de %d es %d\n", iNum, iDoble);
  printf("El triple de %d es %d\n", iNum, iTriple);

  return 0;
}