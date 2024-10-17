/*
 * EJERCICIO:
 * - Crea ejemplos de funciones básicas que representen las diferentes
 *   posibilidades del lenguaje:
 *   Sin parámetros ni retorno, con uno o varios parámetros, con retorno...
 * - Comprueba si puedes crear funciones dentro de funciones.
 * - Utiliza algún ejemplo de funciones ya creadas en el lenguaje.
 * - Pon a prueba el concepto de variable LOCAL y GLOBAL.
 * - Debes hacer print por consola del resultado de todos los ejemplos.
 *   (y tener en cuenta que cada lenguaje puede poseer más o menos posibilidades)
 *
 * DIFICULTAD EXTRA (opcional):
 * Crea una función que reciba dos parámetros de tipo cadena de texto y retorne un número.
 * - La función imprime todos los números del 1 al 100. Teniendo en cuenta que:
 *   - Si el número es múltiplo de 3, muestra la cadena de texto del primer parámetro.
 *   - Si el número es múltiplo de 5, muestra la cadena de texto del segundo parámetro.
 *   - Si el número es múltiplo de 3 y de 5, muestra las dos cadenas de texto concatenadas.
 *   - La función retorna el número de veces que se ha impreso el número en lugar de los textos.
 *
 * Presta especial atención a la sintaxis que debes utilizar en cada uno de los casos.
 * Cada lenguaje sigue una convenciones que debes de respetar para que el código se entienda.
*/
#include <stdio.h>

int calcularEdad(int iAñoNacimiento){
  int iYearActual = 2024;
  int iEdadActual = iYearActual - iAñoNacimiento ;

  return iEdadActual;
}

int cuentaNumerica(char nombre[50], char nombre2[50]) {

  int iCorrecto = 0;
  for(int i = 1;i <=100; i++){
    if(i % 3 == 0 && i % 5 == 0){
      // printf("%s, %s", nombre, nombre2);
      iCorrecto++;
    } else if(i % 3 == 0){
      // printf("%s",nombre);
      iCorrecto++;
    } else if(i % 5 == 0){
      // printf("%s",nombre2);
      iCorrecto++;
    }
  }

  return iCorrecto;
}

int main (){

  //Funciones
  int iAñoNacimiento;
  /*
  printf("En que año naciste: ");
  scanf("%d", &iAñoNacimiento);
  printf("> En este momento tienes %d años\n", calcularEdad(iAñoNacimiento));
  */
  // Dificil
  char nombre[50], nombre2[50];
  printf("Introduce un string: ");
  fgets(nombre, 50, stdin); //scanf("%s", nombre);

  printf("Introduce un string: ");
  fgets(nombre2, 50, stdin);

  int iValor = cuentaNumerica(nombre, nombre2);
  printf("Se ha imprimido un total de %d", iValor);

  return 0;
}
