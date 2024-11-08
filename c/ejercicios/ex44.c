 #include <stdio.h>

 struct Alumno {
   char   nombre[50];
   int    edad;
   float  nota;
 };

int main (){
  struct Alumno alumno[3];

  for(int i = 0; i < 3; i++){
    printf("-- Alumno %d --\n", i + 1);
    printf("Nombre: ");
    scanf("%s", alumno[i].nombre);
    printf("Edad: ");
    scanf("%d", &alumno[i].edad);
    printf("Nota: ");
    scanf("%f", &alumno[i].nota);
  }

  printf("\n-- Lista de Alumnos --\n");
  for(int i = 0; i < 3; i++){
    printf("Alumno %d: %s, %d, %.2f\n", i + 1, alumno[i].nombre, alumno[i].edad, alumno[i].nota);
  }

  return 0;
}
