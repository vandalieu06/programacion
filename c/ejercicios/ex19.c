/*
  Programa que hace un descuento del 10% si supera 100€
  compra. Pedir 10 precios de productos al usuario, mostrar
  el total y el descuento si corresponde.
*/

#include <stdio.h>

int main (){
  printf("--------------------------\n");
  printf("     Ticket de Compra     \n");
  printf("--------------------------\n");

  int total = 0;
  float iNum;

  for(int i = 0; i < 10; i++){
    printf("Introduce 1 producto: ");
    scanf("%f", &iNum);

    total += iNum;
  }

  if (total > 100){
    float descuento = total * 0.9;
    printf("El total ha sido %d€ y con el descuento te toca pagar: %.2f€\n", total, descuento);
  } else {
    printf("El total ha sido sin descuento: %d€ \n", total);
  }


  return 0;
}
