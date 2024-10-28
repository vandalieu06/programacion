#include <stdio.h>
#include <string.h>

/*
  ¿Qué es la recursividad y en qué casos puede ser útil en lugar de usar bucles?
  ¿Cuál es la diferencia entre los operadores "==" y "===" en lenguajes como JavaScript?
  ¿Cómo se maneja la gestión de memoria en C y por qué es importante entender el uso de punteros y la función malloc()?
  ¿Qué son las pruebas unitarias (unit tests) y cuál es su importancia en el desarrollo de software?
  ¿Cómo funcionan las promesas en JavaScript y en qué se diferencian de los callbacks?
*/

int main() {

  printf("QUIZ DE PROGRAMACION\n");
  printf("---------------------\n");

  int iPoints = 0;
  char iPreguntas[5][255];
  char iOpciones[20][255];
  int iRespuestas[5];

  // DEFINIMOS LAS PREGUNTAS
  strcat(iPreguntas[0], "¿Qué es la recursividad y en qué casos puede ser útil en lugar de usar bucles?");
  strcat(iPreguntas[1], "¿Cuál es la diferencia entre los operadores \"==\" y \"===\" en lenguajes como JavaScript?");
  strcat(iPreguntas[2], "¿Cómo se maneja la gestión de memoria en C y por qué es importante entender el uso de punteros y la función malloc()?");
  strcat(iPreguntas[3], "¿Qué son las pruebas unitarias (unit tests) y cuál es su importancia en el desarrollo de software?");
  strcat(iPreguntas[4], "¿Cómo funcionan las promesas en JavaScript y en qué se diferencian de los callbacks?");

  //OPCIONES
  // Pregunta 1
  strcat(iOpciones[0], "A) Es una técnica que permite que una función se llame a sí misma, útil para problemas donde hay un caso base y una reducción del problema.\n"); //CORRECTA
  strcat(iOpciones[1], "B) Es una forma de repetir un bloque de código varias veces, sin necesidad de condiciones de parada.\n");
  strcat(iOpciones[2], "C) Es un tipo especial de bucle que se utiliza en lenguajes de bajo nivel como C.\n");
  strcat(iOpciones[3], "D) Es una técnica para optimizar el uso de memoria en estructuras de datos complejas.\n");

  // Pregunta 2
  strcat(iOpciones[4], "A) '==' compara valores y tipos, mientras que '===' compara solo valores.\n");
  strcat(iOpciones[5], "B) '==' compara solo valores, mientras que '===' compara valores y tipos.\n"); //CORRECTA
  strcat(iOpciones[6], "C) Ambos operadores son iguales y se pueden usar indistintamente.\n");
  strcat(iOpciones[7], "D) '===' compara cadenas y números, mientras que '==' solo compara números.\n");

  // Pregunta 3
  strcat(iOpciones[8], "A) La memoria se asigna y se libera automáticamente, por lo que no es necesario el uso de punteros.\n");
  strcat(iOpciones[9], "B) Los punteros y 'malloc()' permiten asignar y liberar memoria manualmente, evitando pérdidas de memoria.\n"); //CORRECTA
  strcat(iOpciones[10], "C) La memoria en C es estática, por lo que 'malloc()' no es útil.\n");
  strcat(iOpciones[11], "D) 'malloc()' se usa solo para crear variables globales, sin relación con la gestión de memoria.\n");

  // Pregunta 4
  strcat(iOpciones[12], "A) Son pruebas que verifican el rendimiento de toda la aplicación.\n");
  strcat(iOpciones[13], "B) Son pruebas automáticas que verifican el funcionamiento de unidades individuales de código, como funciones.\n"); //CORRECTA
  strcat(iOpciones[14], "C) Son pruebas manuales que se realizan al final del desarrollo para asegurarse de que todo funcione.\n");
  strcat(iOpciones[15], "D) Son pruebas que solo se aplican a aplicaciones web.\n");

  // Pregunta 5
  strcat(iOpciones[16], "A) Las promesas y los callbacks son exactamente iguales en funcionamiento.\n");
  strcat(iOpciones[17], "B) Las promesas permiten manejar operaciones asíncronas y pueden encadenarse, lo que mejora la legibilidad sobre los callbacks.\n"); //CORRECTA
  strcat(iOpciones[18], "C) Los callbacks siempre se ejecutan antes que las promesas.\n");
  strcat(iOpciones[19], "D) Las promesas solo funcionan para operaciones síncronas y los callbacks para operaciones asíncronas.\n");



  // PROGRAMA
  int iValidador = 4;
  int j = 0;

  for(int i = 0; i < 5; i++){
    printf("\n--- QUIZ - PREGUNTA %d ---\n", i + 1);
    printf("%s\n", iPreguntas[i]); // Imprimios la pregunta correpondiente
    for (; j < iValidador; j++) { // Escogemos del array de pregunats solamente 4
      printf("%s", iOpciones[j]); // OImprimimos las opciones de la pregunta
    }

    printf("Cual es la respuesta: ");
    scanf("%d", &iRespuestas[i]);

    if (i == 0 ){
      if (iRespuestas[i] == 1) {
        iPoints++;
        printf("Respuesta correcta!!!\n");
        printf("Tus puntos actuales son: %d\n", iPoints);
      } else{
        printf("Respuesta incorrecta!!!\n");
        printf("Tus puntos actuales son: %d\n", iPoints);
      }
    } else if (i == 1){
      if (iRespuestas[i] == 2) {
        iPoints++;
        printf("Respuesta correcta!!!\n");
        printf("Tus puntos actuales son: %d\n", iPoints);
      } else{
        printf("Respuesta incorrecta!!!\n");
        printf("Tus puntos actuales son: %d\n", iPoints);

      }
    } else if (i == 2){
      if (iRespuestas[i] == 2) {
        iPoints++;
        printf("Respuesta correcta!!!\n");
        printf("Tus puntos actuales son: %d\n", iPoints);
      } else{
        printf("Respuesta incorrecta!!!\n");
        printf("Tus puntos actuales son: %d\n", iPoints);

      }
    } else if (i == 3){
      if (iRespuestas[i] == 2) {
        iPoints++;
        printf("Respuesta correcta!!!\n");
        printf("Tus puntos actuales son: %d\n", iPoints);
      } else{
        printf("Respuesta incorrecta!!!\n");
        printf("Tus puntos actuales son: %d\n", iPoints);
      }
    } else if (i == 4){
      if (iRespuestas[i] == 2) {
        iPoints++;
        printf("Respuesta correcta!!!\n");
        printf("Tus puntos actuales son: %d\n", iPoints);
      } else{
        printf("Respuesta incorrecta!!!\n");
        printf("Tus puntos actuales son: %d\n", iPoints);
      }

      printf("\n--- FINAL DEL JUEGO ---\n", iPoints);
      if (iPoints >= 3){
        printf("Has aprovado con un total de %d preguntas correctas\n", iPoints);
      } else {
        printf("Has suspendido con un total de %d preguntas incorrectas\n", 5 - iPoints);
      }
    }

    iValidador += 4;
  }

  return 0;
}
