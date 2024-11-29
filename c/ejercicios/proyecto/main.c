#include <stdio.h>
#include <stdlib.h>
#include <time.h>


void crearMapa (char cMapa[6][6]){
  for (int i = 0; i < 6; i++){

    if (i == 5){
      for (int j = 0; j < 6; j++){
        cMapa[i][j] = (char)(j + '0');
      }
      return;
    }

    for (int j = 0; j < 6; j++){
      if (j == 0){
        cMapa[i][j] = (char)(i + '0');
      }else {
        cMapa[i][j] = '~'; //Commilas simple porque es un caracter si fuese varios acaracteres serian commillas dobles
      }
    }
  }
}

void mostrarMapa(char cMapa[6][6]){
  for (int i = 0; i < 6; i++){
    for (int j = 0; j < 6; j++){
      printf("%c ", cMapa[i][j]);
    }
    printf("\n");
  }
}

void insertarBarco (char cMapa[6][6], int *iBarcoX, int *iBarcoY){
  //Configuramos los numeros aleatorios
  srand((unsigned)time(NULL));

  *iBarcoX = (rand() % 5) + 1; // Barco  posiscion 1 al 5
  *iBarcoY = (rand() % 5); // Barco del 0 al 4
  printf("Actual: x = %d & y = %d\n", *iBarcoX, *iBarcoY);
  cMapa[iBarcoY][iBarcoX] = 'o';
} 

int main (){
  char cMapa[6][6];
  crearMapa(cMapa);

  printf("--Turno 1\n");
  mostrarMapa(cMapa);

  printf("\n--Turno 2\n");
  insertarBarco(cMapa);
  mostrarMapa(cMapa);

  return 0;
}