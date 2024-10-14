/*
Lo que necesitas:
-   Conocimientos básicos de C:
        Control de flujo (if, while, for).
        Funciones y estructuras de datos.
        Entrada/salida (I/O).
        Manejo de archivos.

-   Interacción con el sistema:
        Uso de la terminal desde C, ejecutando comandos del sistema 
        con funciones como system() o exec().
        Manejo de procesos (fork, exec, wait).

-   Compilador de C:
        Para compilar tus programas necesitarás gcc o clang.

-   Makefiles:
        Para gestionar la compilación de proyectos más grandes.

-   Libraries:
        Algunas librerías útiles pueden ser ncurses (para 
        interfaces en la terminal) o libcurl (para hacer peticiones HTTP).

*/
#include <stdio.h>
#include <string.h>

struct Persona {
  char nombre[50];
  int data;
};

//https://luiselectronic.com/lenguaje-c/estructuras-de-datos-en-c/

int main () {
  struct Persona persona1;
  strcpy(persona1.nombre, "Jhonny");
  persona1.data = 38;

  printf("Nombre: %s\n", persona1.nombre);
  printf("Edad: %d\n", persona1.data);

  return 0;
}