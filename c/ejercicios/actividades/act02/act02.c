#include <stdio.h>
#include <string.h>

int main (){
  printf("--- AGREGAR JUGADORES ---\n");

  char cJugadores[5][100];
  int iExperiencia[5];
  char cExperiencia[5][100];

  for (int i = 0; i < 5; i++) {
    //PASO 1
    printf("Nombre del Jugador%d: ", i+1);
    scanf("%100s", cJugadores[i]);
    printf("Introduce tu experiencia (1.principiant, 2.intermedi o 3.expert): ");
    scanf("%d", &iExperiencia[i]);

    //PASO 2
    if( iExperiencia[i] == 1){
      strcpy(cExperiencia[i], "principiant");
    } else if( iExperiencia[i] == 2){
      strcpy(cExperiencia[i], "intermedi");
    } else if( iExperiencia[i] == 3){
      strcpy(cExperiencia[i], "expert");
    } else{
      printf("Error al agregar al usuario!!!\n");
    }
  }

  // PASO 3
  printf("--- LISTA DE JUGADORES ---\n");
  for (int i = 0; i < 5; i++) {
    printf("%d. %s - %s\n", i + 1, cJugadores[i], cExperiencia[i]);
  }

  // PASO 4
  printf("\n--- LISTA DE JUGADORES ORDENADA ---\n");
  int iListaNum = 1;
  for (int i = 0; i < 5; i++) {
    int iComprovacion = strcmp(cExperiencia[i], "expert");
    if (iComprovacion == 0) {
      printf("%d. %s - %s\n", iListaNum, cJugadores[i], cExperiencia[i]);
      iListaNum++;
    }
  }

  for (int i = 0; i < 5; i++) {
    int iComprovacion = strcmp(cExperiencia[i], "intermedi");
    if (iComprovacion == 0) {
      printf("%d. %s - %s\n", iListaNum, cJugadores[i], cExperiencia[i]);
      iListaNum++;

    }
  }

  for (int i = 0; i < 5; i++) {
    int iComprovacion = strcmp(cExperiencia[i], "principiant");
    if (iComprovacion == 0) {
      printf("%d. %s - %s\n", iListaNum, cJugadores[i], cExperiencia[i]);
      iListaNum++;

    }
  }

  // PASO 5
  return 0;
}
