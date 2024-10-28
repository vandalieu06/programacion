/*
  Programa que genre palabras aleatorias de 10 caracteres
*/

#include <stdio.h>
#include <time.h>
#include<stdlib.h>

int main (){
  srand((unsigned)time(NULL));
  char cAbecedario[] = "abcdefghijklmnopqrstuvwxyz";
  int iNumArrray = sizeof(cAbecedario) / sizeof(cAbecedario[0]) - 1; // ltras del abecedario - 1
  char cPalabra[10];

  printf("%d\n", iNumArrray);

  for (int i = 0; i < 10; i++){
    int iRandom = rand() % iNumArrray;
    cPalabra[i] = cAbecedario[iRandom];
    printf("%c", cPalabra[i]);
  }
  printf("\n");
  return 0;
}
