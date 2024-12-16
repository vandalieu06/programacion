/*
  Progarma que pida 5 numeros pares al usuario,
  si no es par tiene que seguir pidiendo.
  AL finalizar mostrar los numeros pares introducidos
*/

#include <stdio.h>

int main (){
  int iNum;
  int iA, iB, iC, iD, iF;
  for (int i = 0; i <= 5; i++) {
    if (i < 5){
      printf("> Introduce un numero par: ");
      scanf("%d", &iNum);
    }

    if (i == 0){
      if (iNum % 2 == 0) {
        iA = iNum;
      } else {
        printf("\033[31mNo has intr+oducido un numero par\033[0m\n");
        i--;
      }
    }else if (i == 1){
      if (iNum % 2 == 0) {
        iB = iNum;
      } else {
        printf("\033[31mNo has introducido un numero par\033[0m\n");
        i--;
      }
    }else if (i == 2){
      if (iNum % 2 == 0) {
        iC = iNum;
      } else {
        printf("\033[31mNo has introducido un numero par\033[0m\n");
        i--;
      }
    }else if (i == 3){
      if (iNum % 2 == 0) {
        iD = iNum;
      } else {
        printf("\033[31mNo has introducido un numero par\033[0m\n");
        i--;
      }
    }else if (i == 4){
      if (iNum % 2 == 0) {
        iF = iNum;
      } else {
        printf("\033[31mNo has introducido un numero par\033[0m\n");
        i--;
      }
    } else {
      printf("Los numeros introducidos son: %d, %d, %d, %d, %d\n", iA, iB, iC, iD, iF);
    }
  }

  return 0;
}