#include <stdio.h> // --> Proporciona funciones para la entrada y salida estándar en C
#include <unistd.h> // --> roporciona acceso a las funciones del sistema operativo y a las llamadas al sistema en sistemas tipo Unix.

int main(){
  /*
    Operadores
    + Suma
    - Resta
    * Multiplicacion
    / division
    % modulo (resto de la division)
  */

  int iA = 3983;
  int iB = 7894;
  int iSuma= iA + iB;
  printf("El valor de A: %d y el valor de B: %d Total: %d \n", iA, iB, iSuma);
  //%d --> Nos muetra el valor de una variable.

  int iC = 74784;
  int iD = 7446;
  float iDivision = (float)iC / iD;
  printf("El resultado del valor C: %d entre el valor D : %d nos da %f\n", iC, iD, iDivision);

  /* 
    Operadores de Relacions
    ==
    !=
    >
    <
    >=
    <=
  */

  int iX = 10;
  int iY = 5;
  int iZ = 10;

  // Condicionales If Else
  if (iX == iY) {
    printf("Los nombres son iguales \n");
  } else if (iX == iZ) {
    printf("No es igual a %d pero es igual a %d \n", iY, iZ);
  }else{
    printf("Los nombres no son iguales.\n");
  }

  // Ternaria
  (iX == iY) ? printf("Los numeros son iguales\n") : printf("Los numeros no son iguales\n");

  // Scanf (interactuar con el usuario)
  int iEdad;
  printf("Dame tu edad: ");
  scanf("%d", &iEdad); // 1: Tipos de valor escrito por el usuario,2: & --> es para escoger una variable. (en prinf no es igual)
  //printf("...\n");
  // sleep(2);
  printf("Tu edad es %d \n", iEdad);

  /* 
    Operadores Logicos
    AND (i): &&
    OR (o): ||
    NOT (no): !
  
  */

  int iEdat = 18;
  int iNota = 7;

  if (iEdat >= 18 && iNota >= 7){
    printf("Bienvenido a la Universidad\n");
  } else {
    printf("Vuelve el Año que viene\n");
  }

  if (iEdat >= 25 || iNota >= 7){
    printf("Bienvenido a la Universidad.\n");
  } else {
    printf("Vuelve el Año que viene.\n");
  }

  /*
    SWITCH (expression){
      case valor1;
        sentencia ...
        break;
      case valor2;
        sentencia ...
        break;
      [default:
        sentencia ...
      ] 
    }
  */

  return 0;
}