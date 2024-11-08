/*
  Control de inventarios
  Estructura nombre, cantidad, precio
  - Pedir al usuario cuantos productos queremos
  - Instrucciones de productos
  - CRear un menu con opciones de:
    1. Mostrar inventario completo
      - Mostrar los productos y el precio total de cada uno (cantidad * precio)
    2. Mostrar valor de inventario
    3. Salir
*/

#include <stdio.h>
struct Inventario {
  char  nombre[50];
  int   cantidad;
  float precio;
};

int main (){
  int iProductos = 0;
  printf("-- INVENTARIO --\n");
  printf("Cuantas productos deasa guardar: ");
  scanf("%d", &iProductos);

  struct Inventario producto[iProductos];
  /*Pedir al usuario datos con scanf + for mas tarde */

  printf("-- MENU --\n");
  printf("1. Mostrar inventario completo\n");
  printf("2. Mostrar valor total del inventario\n");
  printf("3. Salir\n");

  int iOpcion = 0;

  while (0 == 0) {
    printf("Elige una opcion: ");
    scanf("%d", &iOpcion);


    switch () {

    }
  }



  return 0;
}
