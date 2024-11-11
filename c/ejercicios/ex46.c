/*
  Control de inventarios
  Estructura nombre, cantidad, precio
  - Pedir al usuario cuantos productos queremos
  - Instrucciones de productos
  - CRear un menu con opciones de:
    1. Mostrar inventario completo
      - Mostrar los productos y el precio total de cada uno (cantidad * precio)
    2. Mostrar valor de inventario
    3. Mostrar un producto determinado
    4. Salir
*/

#include <stdio.h>
//#include <stdlib.h>
//#include <windows.h>

struct Inventario {
  char  nombre[50];
  int   cantidad;
  float precio;
};

void listarInventario (struct Inventario *producto, int iProductos) {
  printf("\n-- INVENTARIO --\n");
  for (int i = 0; i < iProductos; i++){
    printf("Producto %d: %s, %d, %.2f\n", i + 1, producto[i].nombre, producto[i].cantidad, producto[i].precio);
  }
};

void calcularValor(struct Inventario *producto, int iProductos){
  printf("\n-- VALOR --\n");
  float iValor = 0;
  for (int i = 0; i < iProductos; i++){
    float iTotal = producto[i].precio * producto[i].cantidad;
    iValor += iTotal;
  }
  printf("El valor total del inventario es de: %.2f\n", iValor);
};

void buscarProducto(struct Inventario *producto, int iProductos){
  int iProducto;
  printf("\n-- BUSQUEDA --\n");
  printf("Que producto buscas: ");
  scanf("%d", &iProducto);

  if (iProducto < 1 || iProducto > iProductos){
    printf("El producto indicado no existe...\n");
    return;
  }

  printf("Producto: %d\n", iProducto);
  printf("Nombre: %s\n", producto[iProducto - 1].nombre);
  printf("Cantidad: %d\n", producto[iProducto - 1].cantidad);
  printf("Precio: %.2f\n", producto[iProducto - 1].precio);

}

int main (){
  printf("-- EJERCICIO INVENTARIO --\n");
  int iProductos = 0;
  printf("Cuantas productos deasa guardar: ");
  scanf("%d", &iProductos);

  struct Inventario producto[iProductos];

  for (int i = 0; i < iProductos; i++){
    printf("\n-- PRODUCTO %d --\n", i + 1);
    printf("Nombre: ");
    scanf("%s", producto[i].nombre);
    printf("Cantidad: ");
    scanf(" %d", &producto[i].cantidad);
    printf("Precio: ");
    scanf("%f", &producto[i].precio);
  }
  /*Pedir al usuario datos con scanf + for mas tarde */
  int iOpcion = 0;
  int iActivo = 1;

  do{
    printf("\n-- MENU --\n");
    printf("1. Mostrar inventario completo\n");
    printf("2. Mostrar valor total del inventario\n");
    printf("3. Mostrar un producto determinado\n");
    printf("4. Salir\n");

    printf("Elige una opcion: ");
    scanf("%d", &iOpcion);


    switch (iOpcion) {
      case 1:
        listarInventario(producto, iProductos);
        break;
      case 2:
        calcularValor(producto, iProductos);
        break;
      case 3:
        buscarProducto(producto, iProductos);
        break;
      case 4:
        printf("Saliendo del programa...\n");
        iActivo = 0;
        break;
    }
  } while (iActivo);

  return 0;
}
