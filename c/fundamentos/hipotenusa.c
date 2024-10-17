/*
  Obtener la hipotenusa a partir de dos catetos
*/

#include <stdio.h>
#include <windows.h>
#include <math.h>

int main () {

  int iC1, iC2;

  printf("Introduce los cactetos\n");
  printf("Cateto 1: ");
  scanf("%d", &iC1);

  printf("Cateto 2: ");
  scanf("%d", &iC2);
  
  //float formula = (iC1 * iC1) + (iC2 * iC2); 
  float formula = sqrt(pow(iC1, 2) + pow(iC2, 2));
  // sqrt() --> Es para obtener la raiz de una numero
  // pow(int, num) --> Es para elevar un numero, se introduce el valor a elevar y a cuando lo queires elevar.
  
  printf("%.2f", formula); 
  return 0;
}