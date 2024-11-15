/*
  Supermecado
  Introduce el valor del producto y el dinero dado 
  por el cliente. Indicar si le falta o si le tenemos
  que dar canvio.
*/

#include <stdio.h> 
// #include <stdlib.h> // abs --> numeros enteros, pasar negativos a positivos
#include <math.h> // fabs --> numeor decimales, pasar negativos a positivos

int main (){

  float iProducto;
  printf("Introduce el valor del producto: ");
  scanf("%f", &iProducto);

  float iRecibo;
  printf("Introduce el dinero dado por el cliente: ");
  scanf("%f", &iRecibo);



  float iCanvio = iRecibo - iProducto;
  if (iCanvio < 0 ) {
    printf("Te falta: %.2f € \n", fabs(iCanvio) );  
  } else {
    printf("El canvio a dar al cliente es: %.2f €\n", iCanvio);
  }

  return 0;
}