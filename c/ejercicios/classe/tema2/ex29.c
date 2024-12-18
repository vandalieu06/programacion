/*
  Pedir al usuaario 10 numero
  Mostrar menu:
    1. Mostrar pares y cantidad
    2. Mostrar impares cantidad
    3. Mostrar la suma de todos los nuemros
    4. Salir
*/
#include <stdio.h>
int main (){
  //Numeros
  int iNums[10];
  printf("Introduce los valores:\n");
  for (int i = 0; i < 10; i++) {
    printf("> Introduce el valor %d: ", i + 1);
    scanf("%d", &iNums[i]);
  }

  //Menu
  printf("\nOpciones\n");
  printf("1. Mostrar pares y cantidad\n2. Mostrar impares cantida\n3. Mostrar la suma de todos los numeros\n4. Salir\n");
  int iOpcion, iSuma;

  for (int i = 0; i < 10; i++){
    printf("Escoge una opcion: ");
    scanf("%d", &iOpcion);

    int iCantidad = 0;
    if (iOpcion == 1){

      for (int i = 0; i < 10; i++){
        if (iNums[i] % 2 == 0){
          printf("%d ", iNums[i]);
          iCantidad++;
        }
        if (i == 9){
          printf("\n");
          printf("La cantidad es:  %d\n", iCantidad);
        }
      }

    }

    if (iOpcion == 2){
      for (int i = 0; i < 10; i++){
        if (iNums[i] % 2 != 0){
          printf("%d ", iNums[i]);
          iCantidad++;
        }
        if (i == 9){
          printf("\n");
          printf("La cantidad es:  %d\n", iCantidad);
        }
      }
    }

    if (iOpcion == 3){
      for(int i = 0; i < 10; i++){
        iSuma+= iNums[i];
      }
      printf("La suma de los nuemros es igual a: %d\n", iSuma);
    }

    if (iOpcion == 4){
      break;
    }

    if (iOpcion <= 1 || iOpcion >= 5){
      printf("> Elige una opcion valida.\n");
    }

  }

  return 0;
}
