/*
  Pedir 5 numeros
  - Almacenar en un array los 5 nuemros
  - Copiar los nuemros en otro array
  - Crear un array con el resultado de la multiplicacion de cada posicion
  Array1 --> 1 2 3 4
  Array2 --> 1 2 3 4
  Array1 --> 1 4 9 16

*/

#include <stdio.h>

int main () {

  //Valores
  int iValores[5];
  printf("Introduce 5 valores\n");
  for(int i = 0; i < 5; i++){
    printf("Valor %d: ", i + 1);
    scanf("%d", &iValores[i]);
  }

  //Backup
  int iValoresBackup[5];
  for(int i = 0; i < 5; i++){
    iValoresBackup[i] = iValores[i];
  }

  //Multiplicacion
  int iResultado[5];
  for(int i = 0; i < 5; i++){
    iResultado[i] = iValores[i] * iValoresBackup[i];
  }

  //Imprimir resultado
  for(int i = 0; i < 5; i++){
    printf("Resultado %d es igual a %d\n", i + 1, iResultado[i]);
  }



  return 0;
}
