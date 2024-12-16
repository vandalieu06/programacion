#include <stdio.h>
#include <string.h>

struct Book {
  char title[100];
  char autor[100];
  int publicationDate;
  char isbn[10];
};

void menuInicial() {
  printf("Personal Library\n");
  printf("Menu: \n");
  printf("1. Add Book\n");
  printf("2. List Books\n");
  printf("3. Search Book by ISBN\n");
  printf("4. Exit\n");
}

void obtainOption(int *iOption){
  printf("Escoger opcion: ");
  scanf("%d", iOption);
}

void obtainDataUser(struct Book *book){
  printf("Insert data: \n");
  
  printf("> Title: ");
  getchar(); //Eliminar del buffer el espacio para que fhgets() no lo lea
  fgets(book->title, 100, stdin); //Para obtnere linea de caracteres con espacio.
  strtok(book->title, "\n"); // Eliminar de la variable title el salto de linea

  printf("> Autor: ");
  fgets(book->autor, sizeof(book->autor), stdin);
  strtok(book->autor, "\n"); // Eliminar de la variable title el salto de linea

  printf("> Publication Date: ");
  scanf("%d", &book->publicationDate);

  printf("> ISBN (9 letters): ");
  scanf("%s", book->isbn);
}

void obtainIsbnUser (char cIsbn[10]){
  printf("Enter the ISBN of the book: ");
  scanf("%s", cIsbn);
}

FILE *readFile(char filePath[]){
  FILE *file;
  file = fopen(filePath, "r");
  
  if (file == NULL){
    return NULL;
  }

  return file;
}

FILE *writeFile(char filePath[]){
  FILE *file;
  file = fopen(filePath, "a+");
  if (file == NULL){
    return NULL;
  }

  return file;
}

void addBook(char filePath[], struct Book *book){
  FILE *file = writeFile(filePath);
  if (file == NULL){
    printf("Error: not add book because...\n");
    return;
  }
  fprintf(file, "%s, %s, %d, %s", book->title, book->autor, book -> publicationDate, book->isbn);
  fclose(file);
}

void listBooks(char filePath[]) {
  FILE *file = readFile(filePath);
  
  if (file == NULL){
    printf("Error: not list books...\n");
    return;
  }

  char linea[100]; 
  printf("---\n");
  while (fgets(linea, sizeof(linea), file) != NULL) {
    printf("%s", linea);
  }
  printf("\n---\n");
  fclose(file);
}

void searchBook(char filePath[], char cUserISBN[]){
  FILE *file = readFile(filePath);
  if (file == NULL){
    printf("Error: not search books...\n");
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
    iContextLength = strlen(context) - 1;    

    for (int i = 1; i < 10; i++){
      sISBN[9 - i] = context[iContextLength - i];  
    }
    sISBN[9] = '\0';
  
    if (strcmp(sISBN, cUserISBN) == 0){
      //printf("The ISBN is equal!\n");
      //printf("%s-%s\n", sISBN, cUserISBN);
      printf("%s\n", context);
      iVoucher = 0;
    } else{
      printf("This book is doesn't exits in local library!.\n\n");
      iVoucher = 0;
    }

  } while(iVoucher == 1);
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