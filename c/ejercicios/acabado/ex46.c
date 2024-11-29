/*
  Control de inventarios
  Estructura nombre, cantidad, precio
  - Pedir al usuario cuantos productos queremos
  - Instrucciones de productos
  - Crear un menu con opciones de:
    1. Mostrar inventario completo
      - Mostrar los productos y el precio total de cada uno (cantidad * precio)
    2. Mostrar valor de inventario
    3. Mostrar un producto determinado
    4. Mostrar productos con una catidad inferior a 2
    5. Actualizar la cantidad de productos
    6. Salir
*/

#include <stdio.h>
//#include <stdlib.h>
//#include <windows.h>

struct Inventario {
  char  nombre[50];
  int   cantidad;
  float precio;
};

void introducirProducto(struct Inventario *producto, int i){
  printf("-- Producto %d \n", i + 1);
  printf("Nombre: ");
  scanf("%s", producto[i].nombre);
  printf("Cantidad: ");
  scanf(" %d", &producto[i].cantidad);
  printf("Precio: ");
  scanf("%f", &producto[i].precio);
}
void mostrarMenu() {
  for (int i = 0; i < 20; i++){
    printf("=");
    if (i == 19) {
      printf("\n");
    }
  }
  printf("        MENU\n");
  for (int i = 0; i < 20; i++){
    printf("=");
    if (i == 19) {
      printf("\n");
    }
  }
  printf("1. Mostrar inventario completo\n");
  printf("2. Mostrar valor total del inventario\n");
  printf("3. Mostrar un producto determinado\n");
  printf("4. Mostrar productos con una catidad inferior\n");
  printf("5. Actualizar la cantidad de productos\n");
  printf("6. Salir\n");
  printf("Elige una opcion: ");
}

void listarInventario (struct Inventario *producto, int iProductos) {
  printf("\n-- Inventario \n");
  for (int i = 0; i < iProductos; i++){
    printf("Producto %d: %s, %d, %.2f\n", i + 1, producto[i].nombre, producto[i].cantidad, producto[i].precio);
  }
};

void calcularValor(struct Inventario *producto, int iProductos){
  printf("\n-- Valor del stock\n");
  float iValor = 0;
  for (int i = 0; i < iProductos; i++){
    float iTotal = producto[i].precio * producto[i].cantidad;
    iValor += iTotal;
  }
  printf("El valor total del inventario es de: %.2f\n", iValor);
};

void buscarProducto(struct Inventario *producto, int iProductos){
  int iProducto;
  printf("\n-- Busqueda\n");
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
};

void listarMenorCantidad(struct Inventario *producto, int iProductos) {
  printf("-- Productos con menos Stock\n");
  for (int i = 0; i < iProductos; i++) {
    if (producto[i].cantidad < 2 ) {
      printf("Producto %d: %s con stock de %d\n", i + 1, producto[i].nombre, producto[i].cantidad);
    }
  }
};

void actualizarProducto(struct Inventario *producto, int iProductos) {
  int iProducto = 0, iCantidad = 0;
  printf("-- Actualizar Producto\n");
  printf("Que proodctuos desea actualizar: ");
  scanf("%d", &iProducto);
  printf("> La actual cantidad del producto %d es de %d\n", iProducto, producto[iProducto - 1].cantidad);
  printf("A que cantidad desea actualizar: ");
  scanf("%d", &iCantidad);

  producto[iProducto - 1].cantidad = iCantidad;
};

int main (){
  printf("-- EJERCICIO INVENTARIO --\n");
  int iProductos = 0;
  printf("Cuantas productos deasa guardar: ");
  scanf("%d", &iProductos);

  struct Inventario producto[iProductos];

  for (int i = 0; i < iProductos; i++){
    introducirProducto(producto, i);
  }

  int iOpcion = 0;
  int iActivo = 1;

  do{
    mostrarMenu();
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
        listarMenorCantidad(producto, iProductos);
        break;
      case 5:
        actualizarProducto(producto, iProductos);
        break;
      case 6:
        printf("Saliendo del programa...\n");
        iActivo = 0;
        break;
      default:
        printf("Ninguna de las opciones correponde a la introducida.\n");
    }

  } while (iActivo);

  return 0;
}
