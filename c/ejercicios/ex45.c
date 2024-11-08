/*
  Crear un catalogo de productos
  Nombre, ID, precio

  - Tendremos 5 productos
  - Pedimos datos al Usuario
  - Listamos Productos
  - Listamos el valor total de la compra
  - Mostrar el mas caro y el mas barato
*/

#include <stdio.h>

 struct Producto {
   int    id;
   char   nombre[50];
   float  precio;
 };

int main (){
  struct Producto producto[5];

  printf("-- Productos --\n");
  for(int i = 0; i < 5; i++){
    printf("Id: ");
    scanf("%d", &producto[i].id);
    printf("Nombre: ");
    scanf("%s", producto[i].nombre);
    printf("Precio: ");
    scanf("%f", &producto[i].precio);
    printf("\n");
  }

  printf("\n-- Lista Productos --\n");

  float iValorCompra = 0;
  for(int i = 0; i < 5; i++){
    printf("Producto %d: %d (id), %s (nombre), %.2f€ (precio)\n", i + 1, producto[i].id, producto[i].nombre, producto[i].precio);
    iValorCompra += producto[i].precio;
  }
  printf("El total del valor de la compra es: %.2f€\n", iValorCompra);

  float max = producto[0].precio, min = producto[0].precio;
  int iPosiscionMax = 0, iPosiscionMin = 0;

  for( int i = 0; i < 5; i++){
    if (max > producto[i].precio){
      max = producto[i].precio;
      iPosiscionMax = i;
    }
    if (min < producto[i].precio){
      min = producto[i].precio;
      iPosiscionMin = i;
    }
  }
  printf("El precio mas alto es de %s con un valor de: %.2f\n", producto[iPosiscionMax].nombre, producto[iPosiscionMax].precio);
  printf("El precio mas bajo es de %s con un valor de: %.2f\n", producto[iPosiscionMin].nombre, producto[iPosiscionMax].precio);

  return 0;
}
