/*
  Escribe una funcion uqe cambie el signo
  de todos los elementros de un array utilizando 
  paso por referencia

  Escribe una funion que intercambie dos elementos de un array
  utilizando paso por refernecia.

  Escribe una funcion que suma un valor a todos los elementos 
  del array utilizando paso por referencia.
*/

#include <stdio.h>

void cambiarSigno (int iNums[]){
  for (int i = 0; i < 4; i++) {
      iNums[i] = -(iNums[i]);
  }
}

void cambiarElementos(int iNums[], int a, int b){
  int tmp = iNums[a - 1];
  iNums[a - 1] = iNums[b - 1];
  iNums[b - 1] = tmp;
}

void sumaValorElemento(int iNums[], int iValor){
  for (int i = 0; i < 4; i++){
    iNums[i] += iValor;
  }
};

void mostrar (int iNums[]){
  for (int i = 0; i < 4; i++){
    printf("%d ", iNums[i]);
    if (i == 3){
      printf("\n");
    }
  }
}

void problemaNum1(){
  printf("--Problema1\n");
  int iNums[4] = {10,3, -5, 7};
  printf("Array inicial: ");
  mostrar(iNums);

  cambiarSigno(iNums);
  
  printf("Array final: ");
  mostrar(iNums);
}

void problemaNum2(){
  printf(" \n--Problema2\n");
  int iNums[4] = {-10,3, -5, 7}; 
  
  printf("Array inicial: ");
  mostrar(iNums);

  int iPosicion1 = 0,  iPosicion2 = 0;
  printf("Que posicion desea cambiar (1 a 4): ");
  scanf("%d", &iPosicion1);
  printf("A que posicion: ");
  scanf("%d", &iPosicion2);

  cambiarElementos(iNums, iPosicion1, iPosicion2);

  printf("Array final: ");
  mostrar(iNums);
}

void problemaNum3(){
  printf("\n--Problema3\n");
  int iNums[4] = {-10,3, -5, 7}; 
  printf("Array inicial: ");
  mostrar(iNums);

  int iValor;
  printf("Que elemento desea sumar a los elementos: ");
  scanf("%d", &iValor);
  sumaValorElemento(iNums, iValor);

  printf("Array final: ");
  mostrar(iNums);
}

int main (){
  problemaNum1();
  problemaNum2();
  problemaNum3();

  return 0;
}