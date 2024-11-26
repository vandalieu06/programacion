/*
Exercici 2:  Sistema de seguiment d'activitat física
Escriu un programa que permeti a un usuari registrar la seva activitat física diària durant una setmana.
Cada dia, l’usuari pot introduir el nombre de minuts d'exercici realitzats. El programa ha de permetre:
  - Afegir el temps d'exercici de cada dia.
  - Mostrar el total de minuts d'exercici de la setmana.
  - Trobar el dia amb més exercici.
  - Mostrar el temps mitjà d'exercici diari.
  - Sortir.
Funcions recomanades:
  - void afegirMinuts(int exercici[], int dia);
  - int calcularTotal(int exercici[]);
  - int trobarDiaMesExercici(int exercici[]);
  - float calcularMitjana(int exercici[]);
Observacions:
  - Utilitza un array d’enters per emmagatzemar el temps d’exercici de cada dia.
  - Fes servir for per calcular el total i el dia amb més exercici.
  - Implementa un menú amb switch per interactuar amb les diferents opcions.
Objectiu:
  - Practicar amb arrays, for, switch, funcions amb valors de retorn, i aritmètica bàsica.

*/
#include <stdio.h>


void menuOpciones() {
  printf("--Menu Opcionos\n");
  printf("1. Afegir temps exercici dia\n");
  printf("2. Mostrar total de minut exercici de la setmana\n");
  printf("3. Trobar dia amb mes exercici\n");
  printf("4. Mostrar el temps mitja d'exercici diari\n");
  printf("5. Salir\n");
}
void añadirMinutos (int iDiasExercici[], int iDia, int iMinutos){
  if (iMinutos <= 0){
    printf("Los minutos que has pasado no son correctos\n");
    return;
  }
  if (iDia < 1 || iDia > 7 ){
    printf("El dia %d introducido no es correcto", iDia);
  }
  iDiasExercici[iDia - 1] += iMinutos;
}

int calcularMinutos(int iDiasEjercicio[]){
  int iTotal = 0;
  for (int i = 0; i < 7; i++) {
    iTotal = iTotal + iDiasEjercicio[i];
  }
  return iTotal;
}

int buscarDiaSuperior (int iDiasEjercicio[]){
  int iMax = iDiasEjercicio[0];
  int iPosicion = 0;
  for (int i = 0; i < 7; i++){
    if (iMax < iDiasEjercicio[i]){
      iMax = iDiasEjercicio[i];
      iPosicion = i;
    }
  }
  return iPosicion;
}
float calcularMedia(int iDiasEjercicio[]){
  int iSumaMinutos = calcularMinutos(iDiasEjercicio);
  float iTotal = (float)iSumaMinutos / 7;
  return iTotal;
}

int main(){
  int iOpcion = 1;
  int iDiasEjercicio[7] = {0};
  int iDia = 0;
  int iMinutos = 0;

  do{
    menuOpciones();
    printf("Introduce la opcion que quieres: ");
    scanf("%d", &iOpcion);
    switch (iOpcion){
      case 1:
        printf("A que dia desea añadir minutos: ");
        scanf("%d", &iDia);
        printf("Cuantos minutos desea añadir: ");
        scanf("%d", &iMinutos);
        añadirMinutos(iDiasEjercicio, iDia, iMinutos);
        for (int i = 0; i < 7; i++) {
          printf("%d\n", iDiasEjercicio[i]);
        }
        break;
      case 2:
        int iExerciciTotal = calcularMinutos(iDiasEjercicio);
        printf("Los minutos que has hehco ejericico son: %dmin\n", iExerciciTotal);
        break;
      case 3:
        int iDiaMasMinutos = buscarDiaSuperior(iDiasEjercicio);
        printf("El dia con mas ejercico ha sido %d con %d min\n", iDiaMasMinutos, iDiasEjercicio[iDiaMasMinutos]);
        break;
      case 4:
        float iDiaMedia = calcularMedia (iDiasEjercicio);
        printf("La media entre los ejercicios es de %.2f min\n", iDiaMedia);
        break;
      case 5:
        printf("Saliendo...\n");
        break;
      default:
        printf("Introduce una opcion correcta...\n");
    }
  }while(iOpcion != 5);

  return 0;
}
