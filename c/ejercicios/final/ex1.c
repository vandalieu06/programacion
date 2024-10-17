/*
  Crear un programa que simuli un caixer automàtic. El programa ha d’oferir un menú amb les següents opcions.
  1. Consultar saldo
  2. Retirar diners
  3. Ingressar diners
  4. Sortir
  El saldo inicial de l'usuari és de 1000 euros.
*/

#include <stdio.h>

int main (){

  int iOpcion, iRetiro, iIngreso;
  int iSaldo = 1000;

  printf("1. Consultar datos\t\t");
  printf("2. Retirar dinero\t\t");
  printf("3. Ingresar dinero\t\t");
  printf("4. Sortir\n");

  for (int i = 0; i < 100; i++){
    printf("Ingresa una opcion: ");
    scanf("%d", &iOpcion);

    if (iOpcion <= 0 || iOpcion > 4){
      printf("Introduce una opcion valida.\n");
    }

    if (iOpcion == 1){
      printf("Tu saldo es: %d\n", iSaldo);
    }

    if (iOpcion == 2){
      printf("Cuanto quieres retirar: ");
      scanf("%d", &iRetiro);

      if(iSaldo >= iRetiro){
        if(iRetiro >= 0){
          iSaldo -= iRetiro;
        } else {
          printf("No tienes saldo suficiente.\n");
        }
      } else {
        printf("No tienes saldo suficiente.\n");
      }
    }

    if (iOpcion == 3){
      printf("Ingresar dinero: ");
      scanf("%d", &iIngreso);

      if(iIngreso > 0){
        iSaldo += iIngreso;
      } else {
        printf("Ingresa un dinero positivo.\n");
      }
    }

    if (iOpcion == 4){
      printf("Saliendo...\n");
      break;
    }
  }

}
