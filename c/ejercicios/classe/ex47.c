/*
  Inventario de productos
    - Crear inventario
    - Calcular Total Producto
    - Calcular IVA (21%) de Producto
    - Calcular total de inventario con IVA
    - Calcular Inventario sin IVA
    - Cacluar dto indicado del producto
*/

#include <stdio.h>

struct Inventario{
  char nombre[50];
  int cantidad;
  float precio;
};

void mostrarMenu(){
  printf("-- Menu\n");
  printf("1. Crear Inventario\n");
  printf("2. Calcular total Producto\n");
  printf("3. Calcular IVA 21 de Producto\n");
  printf("4. Calcular total de inventario con IVA\n");
  printf("5. Calcular Inventario sin IV\n");
  printf("6. Calcurat dto de un producto\n");
  printf("7. Salir\n");
}
int crearInventario(){
  int iProductos;
  printf("Cuantos productos deseas crear: ");
  scanf("%d", &iProductos);

  return iProductos;
}

void crearProductos(struct Inventario *producto, int iProductos) {
  for (int i = 0; i < iProductos; i++){
    printf("-- Producto %d \n", i + 1);
    printf("Nombre: ");
    scanf("%s", producto[i].nombre);
    printf("Cantidad: ");
    scanf(" %d", &producto[i].cantidad);
    printf("Precio: ");
    scanf("%f", &producto[i].precio);
  }
}

//FUNCIONES DE CALCULO
float calcularTotalProducto(struct Inventario *producto, int iNum){
  float iTotal = producto[iNum - 1].precio * producto[iNum - 1].cantidad;
  return iTotal;
}

float calcularIvaProducto(struct Inventario *producto, int iProducto){
  float fIva = 1.21;
  float fTotal = producto[iProducto - 1].precio * fIva;
  return fTotal;
}

float cacluarTotalInventarioIva(struct Inventario *producto, int iProductos){
  float fTotal = 0;
  float iProducto;
  float fIva = 1.21;
  for (int i = 0; i < iProductos; i++){
    iProducto = calcularTotalProducto(producto, i + 1);
    fTotal += (iProducto * fIva);
  }

  return fTotal;
}

float cacluarTotalInventario(struct Inventario *producto, int iProductos) {
  float fTotal = 0;
  for (int i = 0;i < iProductos; i++){
    fTotal += calcularTotalProducto(producto, i + 1);
  }

  return fTotal;
}
float calcularDescuentoProducto(struct Inventario *producto, int iProducto, float iDescuento){
  if (iProducto < 1){
    return 0;
  }
  float fDescuentoReal = 1 - (iDescuento / 100);
  float iTotal = producto[iProducto - 1].precio * fDescuentoReal;
  return iTotal;
}

/*------------------------------------------------------ */
int main() {
  printf("--- INVENTARIO ---\n");
  int iTrue = 1;

  int iProductos = crearInventario();
  int iProducto = 0;
  struct Inventario producto[iProductos];

  do{
    mostrarMenu();

    printf("Que opcion escoges: ");
    int iOpcion = 0;
    scanf("%d", &iOpcion);

    switch (iOpcion) {
      case 1:
        crearProductos(producto, iProductos);
        break;
      case 2:
        printf("De que producto desea obtener el total: ");
        scanf("%d", &iProducto);
        float valorProducto = calcularTotalProducto(producto, iProducto);
        printf("El valor total de producto en stock es de %.2f\n", valorProducto);
        break;
      case 3:
        printf("De que producto desea obtener el precio IVA: ");
        scanf("%d", &iProducto);
        float iProductoIva = calcularIvaProducto(producto, iProducto);
        printf("El precio del producto con IVA es de: %.2f\n", iProductoIva);
        break;
      case 4:
        printf("");
        float iInventarioTotalIva = cacluarTotalInventarioIva(producto, iProductos);
        printf("El precio del total de productos con IVA es de: %.2f\n", iInventarioTotalIva);
        break;
      case 5:
        printf("");
        float iInventarioTotal = cacluarTotalInventario(producto, iProductos);
        printf("El precio del total de productos con sin IVA es de: %.2f\n", iInventarioTotal);
        break;
      case 6:
        printf("De que producto desea obtener el descuento: ");
        scanf("%d", &iProducto);
        printf("Introduce el descuento: que desea aplicar (1 a 100): ");
        int iDescuento = 21;
        scanf("%d", &iDescuento);
        float iProdutoDescuento = calcularDescuentoProducto(producto, iProducto, iDescuento);
        printf("El producto con descuento da un valor de: %.2f\n", iProdutoDescuento);
        break;
      case 7:
        printf("Saliendo...\n");
        iTrue = 0;
        break;
    }

  }while(iTrue != 0);

  return 0;
}
