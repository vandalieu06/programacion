/*
  Pedir 2 numeros 
  Mostrar el menu
    1. Calcular el numero mas grande
    2. Calcular el numero mas pequeño
    3. Calcular si son iguales
    4. Calcular si son diferentes    
*/

# include <stdio.h>

int main () {
  
  int iOpcion, iA, iB;

  printf("OPCIONES\n");
  printf("1 - Mas grande\t");
  printf("2 - Mas pequeño\t");
  printf("3 - Es igual\t");
  printf("4 - No es igual\n");

  printf("Escoge una opcione: ");
  scanf("%d", &iOpcion);

  if (iOpcion >= 5 || iOpcion == 0) {
    printf("La opcion escogida no existe\n");
  } else {  
    printf("Introduce dos valores: \n");
    printf("Valor 1: ");
    scanf("%d", &iA);

    printf("Valor 2: ");
    scanf("%d", &iB);
  }

  if (iOpcion == 1) {
    ( iA > iB) 
      ? printf("El numero %d es mas grande que %d\n", iA, iB)
      : printf("El numero %d es mas grande que %d\n", iB, iA);
  }

  if (iOpcion == 2) {
    ( iA < iB)
      ? printf("El numero %d es mas pequeño que %d\n", iA, iB)
      : printf("El numero %d es mas pequeño que %d\n", iB, iA);
  }

  if (iOpcion == 3) {
    (iA == iB) 
      ? printf("El numero %d es igual a %d\n", iA, iB) 
      : printf("El numero %d no es igual a %d\n", iA, iB);
  }
  if (iOpcion == 4) {
    (iA != iB) 
      ? printf("El numero %d no es igual a %d\n", iA, iB) 
      : printf("El numero %d es igual a %d\n", iA, iB);
  }

  return 0;
}