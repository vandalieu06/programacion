#include <stdio.h>
int main () {
  
  int iOpcion,iN1, iN2, iN3;
  int tmp;

  printf("OPCIONES\n");
  printf("1 - Asendente\t");
  printf("2 - Descendente\n");

  printf("Escoge una opcion: ");
  scanf("%d", &iOpcion);

  if (iOpcion >= 3 || iOpcion == 0) {
    printf("La opcion escogida no existe\n");
  } else {  
    printf("Introduce tres valores: \n");
    printf("Valor 1: ");
    scanf("%d", &iN1);

    printf("Valor 2: ");
    scanf("%d", &iN2);

    printf("Valor 3: ");
    scanf("%d", &iN3);
  }

  if (iOpcion == 1){
    
    if (iN1 < iN2) {
    tmp = iN1;
    iN1 = iN2;
    iN2 = tmp;
    }

    if (iN1 < iN3){
      tmp = iN1;
      iN1 = iN3;
      iN2 = tmp;
    }

    if (iN1 < iN3){
      tmp = iN2;
      iN1 = iN3;
      iN2 = tmp;
    }
    printf("El numero mayor es %d, el mediano %d y el pequeño %d.\n", iN1, iN2, iN3);

  }
  if (iOpcion == 2){

    if (iN1 > iN2) {
    tmp = iN1;
    iN1 = iN2;
    iN2 = tmp;
    }

    if (iN1 > iN3){
      tmp = iN1;
      iN1 = iN3;
      iN2 = tmp;
    }

    if (iN1 > iN3){
      tmp = iN2;
      iN1 = iN3;
      iN2 = tmp;
    }

    printf("El numero menor es %d, el mediano %d y el grande %d.\n", iN1, iN2, iN3);
  }
  return 0;
}