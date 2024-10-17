#include <stdio.h>
//#include <string.h>

typedef struct {
  char iAutor[50];
  char iNombre[50];
  int iPaginas;
  float iPrecio;
} Libro;

int main (){
  Libro libro[1];

  for(int i = 0; i <= 1; i ++){
    printf("> Introduce el nombre del autor %d: ", i + 1);
    fgets(libro[i].iAutor, 50, stdin);
    printf("|_ Introduce el nombre del libro %d: ", i + 1);
    fgets(libro[i].iNombre, 50, stdin);
    printf("|_ Introduce el numero de paginas %d: ", i + 1);
    scanf("%d", &libro[i].iPaginas);
    printf("|_ Introduce el precio %d: ", i + 1);
    scanf("%f", &libro[i].iPrecio);
    getchar(); //Consumir el /n en el buffer creado por snacf()
    printf("\n");
  }

  for(int i = 0; i <= 1; i ++){
    printf("%s", libro[i].iAutor); // No se necesita \n aquí, ya que fgets ya incluye el salto de línea
    printf("%s", libro[i].iNombre);
    printf("%d\n", libro[i].iPaginas);
    printf("%.2f\n", libro[i].iPrecio);
  }



  return 0;
}
