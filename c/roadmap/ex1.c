/*
 * EJERCICIO:
 * - Crea ejemplos utilizando todos los tipos de operadores de tu lenguaje:
 *   Aritméticos, lógicos, de comparación, asignación, identidad, pertenencia, bits...
 *   (Ten en cuenta que cada lenguaje puede poseer unos diferentes)
 * - Utilizando las operaciones con operadores que tú quieras, crea ejemplos
 *   que representen todos los tipos de estructuras de control que existan
 *   en tu lenguaje:
 *   Condicionales, iterativas, excepciones...
 * - Debes hacer print por consola del resultado de todos los ejemplos.
 *
 * DIFICULTAD EXTRA (opcional):
 * Crea un programa que imprima por consola todos los números comprendidos
 * entre 10 y 55 (incluidos), pares, y que no son ni el 16 ni múltiplos de 3.
 *
 * Seguro que al revisar detenidamente las posibilidades has descubierto algo nuevo.
*/

#include <stdio.h>

void comprovarMajoria(int edad){
  if (edad >= 18){
    printf("> Eres major de edad y puedes ingresar a la universidad.\n");
  } else{
    printf("> Eres menor de edad, vuelve cunado seas major de edad.\n");
  }
}

void ejercicioDificil(){
  int x = 10;
  int y = 55;

  for (int i = 10; i <= y; i++){
    if (i % 2 == 0 && i % 3 != 0 && i != 16){
      printf("%d, ", i);
    }
    if (i == 55){
      printf("...\n");
    }
  }

}

int main() {
  //Aritmeticos

  //Logicos

  //Comparacion
  int x = 9;
  int y = 9;
  printf("\n#Comparacion\n");
  printf("NOTA: (0 => false, 1 => true)\n");
  printf("> Son iguales: x == y => %d \n", x == y);
  printf("> No son iguales: x != y => %d \n", x != y);
  printf("> Es mayor: x > y => %d \n", x > y);
  printf("> Es menor: x > y => %d \n", x < y);

  //Bits
  int a = 5;  // 0101 en binario
  int b = 3;  // 0011 en binario
  int total1 = a & b;  // c será 1 (0001 en binario) - El resultado es 1 solo si ambos bits son 1.
  int total2 = a | b;  // c será 7 (0111 en binario) - El resultado es 1 si al menos uno de los bits es 1.
  int total3 = a ^ b;  // c será 6 (0110 en binario) - El resultado es 1 si los bits son diferentes.
  int total4 = ~a;     // c será -6 (en binario, todos los bits de a invertidos) - Los 0s se convierten en 1s y los 1s en 0s.
  int total5 = a << 1; // c será 10 (0101 --> 01010 en binario) - Desplaza los bits de un número hacia la izquierda, llenando con ceros a la derecha.
  int total6 = a >> 1; // c será 2 (0101 --> 0010 en binario) - Desplaza los bits de un número hacia la derecha.

  printf("\n#Bits\n");
  printf("> %d, %d, %d, %d, %d, %d\n", total1, total2, total3, total4, total5, total6);

  //Ejemplos
  printf("\n#Ejercicios\n");

  int iNom;
  printf("Introduce tu edad: ");
  scanf("%d", &iNom);
  comprovarMajoria(iNom);

  //Ejercicio Dificil
  printf("\n#Ejercicio Dificil\n");
  ejercicioDificil();
  return 0;
}
