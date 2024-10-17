/* 
  Mostrar un menu con als siguientes opciones:
  1. Mostrar por pantalla del 1 al 20
  2. Mostrar por pantalla del 20 al 1
  3. Mostrar por patalla del 1 al 20 (pares)
  4. Mostrar por pantalla del 1 al 20 (impares)
  5. Mostrar por pantalla del 20 al 1 (pares)
  6. Mostrar por pantalla del 20 al 1 (impares)
*/

#include <stdio.h>

void menorMayor(int i, int comparacion) {
  while (i <= 20){
      printf("%d ", i);
      if (i == 20) {
        printf("\n");
      } 
      i++;
  }
}

void fOpciones () {

  // MENU DE OPCIONES
  printf("Menu de opciones: \n");
  printf("1. Mostrar por pantalla del 1 al 20\n");
  printf("2. Mostrar por pantalla del 20 al 1\n");
  printf("3. Mostrar por patalla del 1 al 20 (pares)\n");
  printf("4. Mostrar por pantalla del 1 al 20 (impares)\n");
  printf("5. Mostrar por pantalla del 20 al 1 (pares)\n");
  printf("6. Mostrar por pantalla del 20 al 1 (impares)\n");


  // OPCION
  int iOpcion;
  printf("Seleciona una opcion: ");
  scanf("%d", &iOpcion);
  

  // CONDICIONALES
  if (iOpcion == 1) {
    int i = 1;
    while (i <= 20) {
      printf("%d ", i);
      if (i == 20) {
        printf("\n");
      } 
      i++;
    }
  } else if (iOpcion == 2) {
    int i = 20;
    while (i >= 1) {
      printf("%d ", i);
      if (i == 1) {
        printf("\n");
      } 
      i--;
    }
  } else if (iOpcion == 3){
    int i = 1;
    while (i <= 20) {

      if (i % 2 == 0){
        printf("%d ", i);
      }
      
      if (i == 20) {
        printf("\n");
      } 

      i++;
    }
  } else if (iOpcion == 4){
    int i = 1;
    while (i <= 20) {

      if (i % 2 != 0){
        printf("%d ", i);
      }
      
      if (i == 20) {
        printf("\n");
      } 

      i++;
      }
  } else if (iOpcion == 5){
    int i = 20;
    while (i >= 1) {

    if (i % 2 == 0){
      printf("%d ", i);
    }
    
    if (i == 1) {
      printf("\n");
    } 

    i--;
    }
  } else if (iOpcion == 6){
    int i = 20;
    while (i >= 1) {

    if (i % 2 != 0){
      printf("%d ", i);
    }
    
    if (i == 1) {
      printf("\n");
    } 

    i--;

    }
  } else {
    printf("Escoge otra opcion\n");
  }

}

int main () {
  fOpciones();

  return 0;
}