/*
  Tenemos tres arrays de caracteres
  - Mostramos el Contenido
  Menu:
    1. Contar numero de caracteres de cadena 1
    2. Copiar de cadeena 1 a cadena 3
    3. Comparar cadena 1 y 2
    4. Concatenar cadena 2 en cadena 1
    5. exit
*/
#include <stdio.h>
#include <string.h>

int main () {

  char cText1[50] = "jhonnyclaure";
  char cText2[50] = "universo";
  char cText3[50] = "";

  printf("--- VALORES POR DEFECTO ---\n");
    printf("String 1: %s\n", cText1);
    printf("String 2: %s\n", cText2);
    printf("String 3: %s\n", cText3);

  int iOpcion = 0;
  printf("\n--- OPCIONES ---\n");
  printf("1. Contar numero de caracteres de cadena 1\n");
  printf("2. Copiar de cadeena 1 a cadena 3\n");
  printf("3. Comparar cadena 1 y 2\n");
  printf("4. Concatenar cadena 2 en cadena 1\n");
  printf("5. Exit\n");


  for (int i = 0; i <100; i++){
    printf("\n--- PROGRAMA ---\n");
    printf("Introduce una opcion: ");
    scanf("%d", &iOpcion);

    if (iOpcion == 1){
      int iCount = strlen(cText1);
      printf("El numero de de caracteres es: %d\n", iCount);
    }

    if (iOpcion == 2){
      strcpy(cText3, cText1);
      printf("La palbar de la cadena 3 es ahora igual a: %s\n", cText3);
    }

    if (iOpcion == 3){
      int iResult = strcmp(cText1, cText2);

      if (iResult > 0){
        printf("Valor 1 es mas grande que el Valor 2: %s > %s\n", cText1, cText2);
      }else if (iResult < 0){
        printf("Valor 1 es mas pequeño que el Valor 2: %s < %s\n", cText1, cText2);
      } else {
        printf("Valor 1 es igual que el Valor 2: %s == %s\n", cText1, cText2);
      }
    }

    if (iOpcion == 4){
      strcat(cText1, cText2);
      printf("La palabra concatendad es igual a: %s\n", cText1);
    }

    if(iOpcion == 5){
      printf("Adios...\n");
      break;
    }
  }



  return 0;
}
