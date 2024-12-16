/*
  Menu:
    1. Registrarse --> Pedimos nombre al usuario y lo guardamos en el fichero
    2. Mostrar Datos --> Mostramos el nombre guardado en el fichero
*/

#include <stdio.h>

int main() {
  int iOptions;
  char cNombre[50];
  char cLinia[100];

  FILE *file;
  char filePath[20] = "ex52.txt";
  file = fopen(filePath, "w");

  do {
    printf("Que quieres hacer? \n1.Registrarte \n2.Mostrar datos \n3.Salir del programa \n");
    printf("Opcion: ");
    scanf("%d", &iOptions);

    switch (iOptions) {
      case 1:
        file = fopen(filePath, "a");
        printf("Que nombre quieres ingresar? ");
        scanf("%s", cNombre);

        if (file == NULL) {
          printf("Ha ocurrido un error al obtener el archivo!!!\n");
          break;
        } 

        fprintf(file, "%s\n", cNombre);
        fclose(file);
        break;
    case 2:
      file = fopen(filePath, "r");

      if (file == NULL){
        printf("Ha ocurrido un error al obtener el archivo!!!\n");
        break;
      }

      while (fgets(cLinia, sizeof(cLinia), file) != NULL) {
        printf("%s", cLinia);
      }

      fclose(file);
      break;

    case 3:
      printf("Saliendo del programa...\n");
      break;
    default:
      break;
    }

  } while (iOptions != 3);

  return 0;
}