#include <stdio.h>
#include <string.h>

//Estructura de los libros
struct Book {
  char title[100];
  char autor[100];
  int publicationDate;
  char isbn[10];
};

// Funcion para el menu de opciones (actualemnte 4 opciones).
void menuInicial() {
  printf("Personal Library\n");
  printf("Menu: \n");
  printf("1. Add Book\n");
  printf("2. List Books\n");
  printf("3. Search Book by ISBN\n");
  printf("4. Exit\n");
}

//Funcion para obtener la opcion del menu del usuario devuelta a trave de un puntero.
void obtainOption(int *iOption){
  printf("Escoger opcion: ");
  scanf("%d", iOption);
}

//Funcion para obtener la infromacion (title, autor, publication_date, isbn) de libro añadido a biblioteca.txt.
void obtainDataUser(struct Book *book){
  printf("Insert data: \n");
  printf("> Title: ");
  getchar(); //Eliminar del buffer el espacio para que fhgets() no lo lea
  fgets(book->title, 100, stdin); //Para obtnere linea de caracteres con espacio.
  strtok(book->title, "\n"); //Eliminar de la variable title el salto de linea añadido por fgets()

  printf("> Autor: ");
  fgets(book->autor, sizeof(book->autor), stdin);
  strtok(book->autor, "\n"); //Eliminar de la variable book el salto de linea añadido por fgets()

  printf("> Publication Date: ");
  scanf("%d", &book->publicationDate);

  printf("> ISBN (9 letters): ");
  scanf("%s", book->isbn);
}

//Funcion para obtener el ISBN de busqueda del usuari.
void obtainIsbnUser (char cIsbn[10]){
  printf("Enter the ISBN of the book: ");
  scanf("%s", cIsbn);
}

//Funcion reutilizable para leer el archivo biblioteca.txt, la lectura es em modo "r", si no se detecta el archvio duevelve NULL.
//Es una funcion que retorna un dato tipo FILE por eso ponemo FILE en vez de void().
FILE *readFile(char filePath[]){
  FILE *file;
  file = fopen(filePath, "r"); //Abrimo el arxivo pasado por el parametro en modo lectura "r".
  
  if (file == NULL){
    return NULL;
  }

  return file; // Devolvemos el arxivo obtenido.
}

//Funcion reutilizable para escribir en el archivo biblioteca.txt, la escritura es en modo "a+", si no se detecta el archvio duevelve NULL.
FILE *writeFile(char filePath[]){
  FILE *file;
  file = fopen(filePath, "a+");
  if (file == NULL){
    return NULL;
  }

  return file;
}

//Funcion para añadir el libro que obtinen por paramteros el path del arxivo y la estructura del libro con los datos insertados del usuario.
void addBook(char filePath[], struct Book *book){
  FILE *file = writeFile(filePath);
  //Si el arxivo nos retorna nulo cerramos el arxivo i mostramos un mensaje de error.
  if (file == NULL){
    printf("Error: not add book because...\n");
    fclose(file);
    return;
  }

  //Insertamos los datos en la estructura Book en el arxivo, con formato CSV (title, autor, book, isbn).
  fprintf(file, "%s, %s, %d, %s", book->title, book->autor, book -> publicationDate, book->isbn);
  fclose(file); //Cerramos el arxivo una vez insertado los datos.
}

//Funcion para listar todos lo libros en el documento pasado como argumento "biblioteca.txt".
void listBooks(char filePath[]) {
  FILE *file = readFile(filePath); //Obtenemo el arxivo o NUll a traves de la funcion readFile()
  
  //Si en file obtenemos null mostramos un mensaje de error, cerramos el arrxivo y paramos la funcion con return. 
  if (file == NULL){
    printf("Error: not list books...\n");
    fclose(file);
    return;
  }

  //Creamos una variable llamada cLineDocument encargada de almacenar la linea revisada con fgets().
  char cLineDocument[100]; 
  printf("---\n");
  
  //Comenzamos un cicilo while que como comprovante ejecuta el metdod fgets() en el documento encargado de recorer las lineas del documento. 
  //Si en la linea que esta revisando no es NULL imprime la linea almacenada en cLineDOcument. En canvio si es NULL para el ciclo y no 
  //imprime mas lineas. Hay que tener en cuenta que fgets() añade uan "\n" al final de cada fila que no ahorra de añadir en el printf().
  //En fgets le pasamo como primer arguneto cLineDOcument para indicar donde se guardara, como segundo argumento le pasamo el tamaño de 
  //cLineDocuments con el metodo sizeof() y como tercer y ultimo argumento de que arxivo obtienen la infromacion (en este se teinen que tener 
  //en quenta que el cursosr se queda en la possicion inmediata despues de la linea leida).

  while (fgets(cLineDocument, sizeof(cLineDocument), file) != NULL) {
    printf("%s", cLineDocument);
  }
  printf("\n---\n");
  fclose(file); //Cerramos el arxivo
}

void searchBook(char filePath[], char cUserISBN[]){
  FILE *file = readFile(filePath);
  if (file == NULL){
    printf("Error: not search books...\n");
    fclose(file);
    return;
  }

  int iVoucher = 1;
  char context[100];
  int iContextLength;
  char sISBN[10];

  do{
    if (fgets(context, sizeof(context), file) == NULL){
      //printf("Error: not line in context\n");
      iVoucher = 0;
      break;
    }
    // Obtenemos el tamaño de la oracion(.txt) [1...100] y le restamos 1 para ir caracter en caracter en la array [0...99]
    iContextLength = strlen(context);

    if (context[iContextLength - 1] == '\n') {
      context[iContextLength - 1] = '\0';
      iContextLength--; // Actualizamos la longitud
    }

    for (int i = 1; i < 10; i++){
      sISBN[9 - i] = context[iContextLength - i];  
    }
    //Añadimos \0 para que la palabra tenga final
    sISBN[9] = '\0';
  
    printf("%s-%s\n", sISBN, cUserISBN);
    if (strcmp(sISBN, cUserISBN) == 0){
      //printf("The ISBN is equal!\n");
      printf("%s\n", context);
      iVoucher = 0;
    }
  } while(iVoucher == 1);
  fclose(file);
}

int main() {
  // Configuracion inciial del path  biblioteca.txt i la structura de los libros
  struct Book book;
  char filePath[20] = "biblioteca.txt";
  int iOption = 1; 
  char cUserISBN[10];
  //Incio programma
  do {
    menuInicial();
    obtainOption(&iOption);
    switch (iOption) {
      case 1:
        obtainDataUser(&book);
        addBook(filePath, &book);
        break;  
      case 2:
        listBooks(filePath);
        break;  
      case 3:
        obtainIsbnUser(cUserISBN);
        searchBook(filePath, cUserISBN);
        break;
      case 4:
        printf("Saliendo...\n");
        break;
    }
  } while (iOption != 4);
  return 0;
}