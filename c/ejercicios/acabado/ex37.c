/*
  Crear un juego que genere numero aleatorio entre 1 y 100
  - Pedir al usuario que lo adivine
  - Tendra 7 intentos
  - Despues de cada intento tiene que decir si el nuemro a adivinar es mas grande o mas pequeño que el introducido.
  - Si lo acierta se acaba el juego y pone WINNER!
  - Si se acaba los 7 intentos finaliza el juego y pone GAME OVER!
*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>

int main() {

  srand((unsigned)time(NULL));

  int iRandom = rand() % 100 + 1;
  int iVidas = 7;
  int iIntentos = 7;
  int iNum;

  printf("ADIVINA EL NUMERO - GAME\n");
  printf("Cargando numero aleatorio...\n");
  printf("Dispones de %d vidas\n", iVidas);

  for (int i = 0; i < iIntentos; i++){
    printf("Introduce el numero: ");
    scanf("%d", &iNum);

    if (iRandom == iNum){
      printf("WINNER!!!\n");
      sleep(2);
      system("curl parrot.live");
      break;
    } else{
      if (iNum > iRandom){
        printf("El numero introducido es mas pequeño que el numero a adivinar.\n");
      }else{
        printf("El numero introducido es mas grande que el numero a adivinar.\n");
      }
      iVidas--;
      if (iVidas == 0){
        printf("GAME OVER!!!\n");
        break;
      } else {
        printf("Te quedan %d vidas.\n", iVidas);
      }
    }
  }

  return 0;
}
