#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    char *pregunta;
    char *opciones[4];
    char *respuesta_correcta;
} Pregunta;

void limpiarBuffer() {
    int c;
    while ((c = getchar()) != '\n' && c != EOF) {}  // Para limpiar el buffer de entrada
}

int main() {
    int numPreguntas;

    // Preguntamos cuántas preguntas tendrá el quiz
    printf("¿Cuántas preguntas tendrá el quiz? ");
    scanf("%d", &numPreguntas);
    limpiarBuffer();  // Limpiar el buffer del '\n' restante

    // Asignar memoria para el número de preguntas
    Pregunta *preguntas = (Pregunta *) malloc(numPreguntas * sizeof(Pregunta)); // El resultado de malloc lo pasa al puntero (Pregunta *)
    if (preguntas == NULL) {
        printf("Error al asignar memoria\n");
        return 1;
    }

    // Asignar y llenar las preguntas
    for (int i = 0; i < numPreguntas; i++) {
        preguntas[i].pregunta = (char *) malloc(256 * sizeof(char));  // Asignar memoria para la pregunta
        if (preguntas[i].pregunta == NULL) {
            printf("Error al asignar memoria\n");
            return 1;
        }

        // Solicitamos la pregunta
        printf("Escribe la pregunta %d: ", i + 1);
        fgets(preguntas[i].pregunta, 256, stdin);
        preguntas[i].pregunta[strcspn(preguntas[i].pregunta, "\n")] = '\0';  // Remover el salto de línea

        // Solicitamos las opciones
        for (int j = 0; j < 4; j++) {
            preguntas[i].opciones[j] = (char *) malloc(256 * sizeof(char));  // Asignar memoria para las opciones
            printf("Escribe la opción %d: ", j + 1);
            fgets(preguntas[i].opciones[j], 256, stdin);
            preguntas[i].opciones[j][strcspn(preguntas[i].opciones[j], "\n")] = '\0';
        }

        // Solicitamos la respuesta correcta
        preguntas[i].respuesta_correcta = (char *) malloc(256 * sizeof(char));
        printf("Escribe la respuesta correcta: ");
        fgets(preguntas[i].respuesta_correcta, 256, stdin);
        preguntas[i].respuesta_correcta[strcspn(preguntas[i].respuesta_correcta, "\n")] = '\0';
    }

    // Variable para almacenar respuestas correctas
    int aciertos = 0;

    // Iniciar el quiz
    for (int i = 0; i < numPreguntas; i++) {
        printf("\nPregunta %d: %s\n", i + 1, preguntas[i].pregunta);
        for (int j = 0; j < 4; j++) {
            printf("%d. %s\n", j + 1, preguntas[i].opciones[j]);
        }

        // Capturamos la respuesta del usuario
        int respuesta;
        printf("Tu respuesta (1-4): ");
        scanf("%d", &respuesta);
        limpiarBuffer();

        // Comparamos la respuesta
        if (strcmp(preguntas[i].opciones[respuesta - 1], preguntas[i].respuesta_correcta) == 0) {
            printf("¡Correcto!\n");
            aciertos++;
        } else {
            printf("Incorrecto. La respuesta correcta era: %s\n", preguntas[i].respuesta_correcta);
        }
    }

    // Mostrar el porcentaje de aciertos
    float porcentaje = ((float) aciertos / numPreguntas) * 100;
    printf("\nHas acertado %d de %d preguntas. Porcentaje: %.2f%%\n", aciertos, numPreguntas, porcentaje);

    // Liberar la memoria asignada
    for (int i = 0; i < numPreguntas; i++) {
        free(preguntas[i].pregunta);
        for (int j = 0; j < 4; j++) {
            free(preguntas[i].opciones[j]);
        }
        free(preguntas[i].respuesta_correcta);
    }
    free(preguntas);

    return 0;
}
