/*
  Crea un programa que simuli el funcionament d'una màquina expenedora. La màquina ofereix tres productes:
  Aigua (1.00 €)
  Refresc (1.50 €)
  Cafè (2.00 €)
  Sortir

  El programa ha de tenir un saldo inicial de 5.00 € i permetre al client comprar productes
  fins que seleccioni l'opció de sortir o es quedi sense saldo suficient. Cada vegada que es compra
  un producte, el saldo s'ha de restar adequadament.

  Si el client intenta comprar un producte sense saldo suficient, el programa ha d'informar-lo que no té prou diners.
*/

#include <stdio.h>

int main(){

  int iOpcion;
  float iSaldo = 5.00;
  printf("Dispones de un saldo de %.2f€\n", iSaldo);
  printf("1. Aigua (1.00 €)\t\t");
  printf("2. Refresc (1.50 €)\t\t");
  printf("3. Cafe (2.00 €)\t\t");
  printf("4. Sortir\n");

  float iAigua = 1.00;
  float iRefresc = 1.50;
  float iCafe = 2.00;

  for (int i = 0; i < 100; i++){
    printf("Ingresa una opcion: ");
    scanf("%d", &iOpcion);

    if (iOpcion <= 0 || iOpcion > 4){
      printf("Introduce una opcion valida.\n");
    }

    if (iOpcion == 1){
      if (iSaldo >= iAigua){
        printf("Has comprado una agua a %.2f€\n", iAigua);
        iSaldo -= iAigua;
      } else{
        printf("No tienes saldo suficiente: %.2f€\n", iSaldo);
      }
    }

    if (iOpcion == 2){
      if (iSaldo >= iRefresc){
        printf("Has comprado un cafe a %.2f€\n", iRefresc);
        iSaldo -= iRefresc;
      } else{
        printf("No tienes saldo suficiente: %.2f€\n", iSaldo);
      }
    }

    if (iOpcion == 3){
      if (iSaldo >= iCafe){
        printf("Has comprado una agua a %.2f€\n", iCafe);
        iSaldo -= iCafe;
      } else{
        printf("No tienes saldo suficiente: %.2f€\n", iSaldo);
      }
    }

    if (iOpcion == 4){
      printf("Saliendo...");
      break;
    }
  }
  return 0;
}
