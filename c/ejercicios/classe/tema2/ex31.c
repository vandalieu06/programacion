/*
  Pedimos 10 numeros al usuario
  Los almacenaom en un array
  Le pedimos un nuemro al usuario y le decimos
  si existe o no
*/

#include <stdio.h>

int main () {

  int iNumeros[10];
  printf("Introduce 10 numeros\n");

  for (int i = 0; i < 10; i++){
    printf("Numero %d: ", i + 1);
    scanf("%d", &iNumeros[i]);
  }

  int iNum;
  printf("Buscar el numero: ");
  scanf("%d", &iNum);

  int iBoolean = 0;
  int iPosicionI[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
  int iRecuento = 0;

  for(int i = 0; i < 10; i++){
    if (iNum == iNumeros[i]){
      iBoolean = 1; // Declaramos que hemos encontrado el nuemro
      iPosicionI[i] = i + 1; //Assignamos en que posicion sin el 0 se ha encontrado, aqui yo represento el 0 como 1
      iRecuento++; // Sumamos cuantas veces se ha encontrado el numero
    }
  }

  if (iBoolean == 1){
    printf("El numero %d se ha visto un total de %d veces.\n", iNum, iRecuento);
    printf("En las posciciones: ");
    for(int i = 0; i < 10; i++){
      if (iPosicionI[i] != 0){
        printf("%d ", iPosicionI[i]);
      }
    }
  } else{
    printf("El nuemro %d no existe en ninsguna linea\n", iNum);
  }

  printf("\n");
  return 0;
}
