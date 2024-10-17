#include <stdio.h>

int main ()  {
    /*
    BUCLES
  */
  int i = 1;
  while (i <= 10) {
    printf("Hola Mundo %d\n", i);
    i++;
  }

  // Array
  int iArray[5]; // Reserva 5 posiciones en memoria, van del 0 al 4

  for(int i = 0; i < 4; i++ ){
    iArray[i] = i;
    printf("%d \n", iArray[i]);
  }



  return 0;
}
