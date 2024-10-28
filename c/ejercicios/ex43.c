/*
  Pedimos al usuario 3 palabras de [50]
    scanf("%49s", variable)

    Mostrar en la pantalla la palabra con mas caracteres
    Mostrar la primera palabra ordenada alfabeticamente
*/

#include <stdio.h>
#include <string.h>


int main (){
  char cPalabra[50], cPalabra2[50], cPalabra3[50];

  printf("--- PROGRAMMA ---\n");
  printf("Palabra 1: ");
  scanf("%49s", &cPalabra);
  printf("Palabra 2: ");
  scanf("%49s", &cPalabra2);
  printf("Palabra 3: ");
  scanf("%49s", &cPalabra3);

  int iLenght[3];
  iLenght[0] = strlen(cPalabra);
  iLenght[1] = strlen(cPalabra2);
  iLenght[2] = strlen(cPalabra3);

  //OPCION - 1
  int max = iLenght[0];
  if (max < iLenght[1]){
    max = iLenght[1];
  }
  if (max < iLenght[2]){
    max = iLenght[2];
  }

  if (max == iLenght[0]){
    printf("La palabra mas larga es: %s\n", cPalabra);
  }else if (max == iLenght[1]){
    printf("La palabra mas larga es: %s\n", cPalabra2);
  }else if (max == iLenght[2]){
    printf("La palabra mas larga es: %s\n", cPalabra3);
  }

  //OPCION - 2
  int iResult = strcmp(cPalabra, cPalabra2);
  int iResult2 = strcmp(cPalabra2, cPalabra3);
  int iResult3 = strcmp(cPalabra, cPalabra3);

  // RESULTADO 1
  if (iResult < 0 ){ // a es mas pequeño que b
    if (iResult3 < 0){ // a es mas pequeño que c
      printf("La palabra alfabetica es: %s", cPalabra);
    }
  }

  // RESULTADO 2
  if (iResult > 0 ){
    if (iResult2 < 0){
      printf("La palabra alfabetica es: %s", cPalabra2);
    }
  }

  // RESULTADO 3
  if (iResult2 > 0){
    if (iResult3 > 0){
      printf("La palabra alfabetica es: %s", cPalabra3);
    }
  }

  return 0;
}
