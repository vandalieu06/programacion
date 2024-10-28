/*
  Fes un programa que permeti jugar a "Pedra, Paper o Tisora" contra l'ordinador.
  L'usuari triarà una opció i l'ordinador en triarà una altra de forma aleatòria.
  Es decidirà qui guanya segons les regles del joc.

  L'usuari ha de triar entre les opcions:
    1 per Pedra
    2 per Paper
    3 per Tisora

  L'ordinador triarà aleatòriament entre 1, 2 i 3.
  El programa ha de mostrar la jugada de l'ordinador i qui és el guanyador o si hi ha empat.
*/
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

int main (){
  //PASO 1
  srand((unsigned)time(NULL));
  int iOpcion, iRandom;
  char iContinue[1];
  printf("--- PIEDRA, PAPEL o TIJERAS ---\n");

  //PASO 2
  for (int i = 0; i < 10; i++) {
    iRandom = rand() % 3 + 1; // 1 al 3 en vez del 0 al 2
    printf("Que opcion escoges (1.Pedra, 2.Paper, 3.Tisora): ");
    scanf("%d", &iOpcion);
    printf("%d - %d\n", iOpcion, iRandom);

    //PASO 2.1
    /*
      1 < 2
      2 < 3
      3 < 1
    */
    if (iOpcion == 1 && iRandom == 1 || iOpcion == 2 && iRandom == 2 || iOpcion == 3 && iRandom == 3 ) {
      printf("Has empatado\n");
    }
    if (iOpcion == 1 && iRandom == 2 || iOpcion == 2 && iRandom == 3 || iOpcion == 3 && iRandom == 1) {
      printf("Has periido\n");
    }
    if (iOpcion == 2 && iRandom == 1 || iOpcion == 3 && iRandom == 2 || iOpcion == 1 && iRandom == 3) {
      printf("Has ganado\n");
    }


    //PASO 2.2
    printf("Quieres jugar otra ronda (y o n)? ");
    scanf("%1s", iContinue);
    int iComprovacion = strcmp(iContinue, "y");

    if (iComprovacion != 0){
      break;
    }

    printf("--- NUEVA RONDA ---\n");
  }

  //PASO
  return 0;
}
