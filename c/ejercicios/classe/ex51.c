/*
  FICHEROS
    - Ficheros de texto - txt
    - Ficheros binarios - 
*/

#include <stdio.h>

int main(){
    
  // Declaramos el puntero del fichero
  char filePath[20] = "nombres.txt";
  FILE *file;
  file = fopen(filePath, "w");

  // Abrir el fixhero con la funcion fopen que tiene 2 parametros (nombre fichero, modo apertura)
  /* Modos de apertura:
    - r: Lee el fichero existente
    - w: crea un fichero nuevo (sobreescribe)
    - a: añade datos a un fichero existente
    - r+: Lee y escribe en un fichero existente
    - w+: Crea un fichero nuevo y escribe
    - a+ Lee y añade datos a un fichero existente
  */
  

  // Funcion para escribir en un fichero fprintf()
  if (file != NULL) {
    fprintf(file, "Name: Aglaea\n");
    fprintf(file, "The memosprite Garmentmaker has an initial SPD of 40 and a Max HP equal\n");
    fprintf(file, "to 66%% of Aglaea's Max HP plus 720.");
    fprintf(file, "[...]");
    fclose(file);
  }


  // Leer de un fichero
  file = fopen(filePath, "r");
  if (file != NULL){
    /*
      fscanf() --> lectura caracter a caracter
      fgets() --> Lectura linia completa

      Parametros: ([...], [...]. [...]):
        0: Variable donde se almacena la linia
        1: Calculamos el tamaño de la linia
        2: Fichero
    */
    printf("Forma 1: \n");
    char linea[100]; // Donde quiero guardar lo que coja, tamaño de la linia y el fichero de donde lo saco
    while (fgets(linea, sizeof(linea), file) != NULL) { // Coge cada una de las linias del fichero y las guarda siempre que sea diferente a null
      printf("%s", linea);
    }
    
    //Cuando leemos un archvio lo que hacemos es pasara el cursor caracter por caracter hasta el final y el cursor se queda al final
    //por eso si volvemos a leer leera donde esta el cursr actualmente, esos significa que estaremos al final y no podra leer nada.
    //Para volver el cursor al prinicipio lo que tenemos que hacer es llamar a la funcion rewind([*file]) y apasarle la variable donde esa el fopen.
    rewind(file);
    
    printf("\nForma 2: \n");
    char caracter;
    do {
      fscanf(file, "%c", &caracter);
      printf("%c", caracter);
    } while (!feof(file)); // El final del fichero es decir, mientras no sea el final del fichero, es decir ! es la negacion
    
    // Cerrar el fichero una vez se a acabado
    fclose(file);
  }
  
  printf("\n");

  return 0;
}