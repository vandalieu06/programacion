#include <stdio.h>
#include <time.h>
#include <stdlib.h>

//Jhonny
void crearMapa (char cMapa[6][6]){ 
  for (int i = 0; i < 6; i++){ 
    if (i == 5){ 
      return;
    } 
    for (int j = 0; j < 6; j++){ 
      if (j != 0){
        cMapa[i][j] = '~'; //Commilas simple porque es un caracter si fuese varios acaracteres serian commillas dobles 
      } else{
        cMapa[i][j] = ' ';
      }
    } 
  } 
}

//Lucía
void mostrarTabla(char iMatriz[6][6]){
  for (int i = 0; i < 6; i++) { // Filas
    for (int j = 0; j < 6; j++) { // Columnas
      if (j == 0) {
        iMatriz[i][j] = (char)(i + '1'); // Cada vez que la j (columnas) sea 0, la columna, el valor de la fila sera el numero de fila (i) + '1' es necesario sumer '1', porque se esta pasando un numero a char, de tal forma que empieza en el primer caracter del codigo ASCI y por lo tanto el resultado daria simbolos aleatorios. Por lo tanto se pone 1 porque se quiere empezar en este
      } else if (i == 5) {
        iMatriz[i][j] = (char)(j + '0'); // Cuando se llegue a la ultima fila, las columnas se iran actualizando. Al igual que en el anterior se suma '0'. En este caso es 0, porque la columna 0 no nos hace falta, queremos que la columna 1 se muestre el 1
      }
      //Jhonny
      if (j == 0 && i == 5){
        iMatriz[i][j] = ' ';
      }
    }
  }     
}


//Jhonny
void imprimirTabla (char iMatriz[6][6]) {
  for (int i = 0; i < 6; i++){
    for (int j = 0; j < 6; j++){
      printf("%c ", iMatriz[i][j]);
    }
    printf("\n");
  }
}

// Jhonny
void insertarBarco (char cMapa[6][6], int *iBarcoFila, int *iBarcoCol) {
  srand((unsigned)time(NULL));
  *iBarcoFila = (rand() % 5); // Fila del 0 al 4
  *iBarcoCol = (rand() % 5) + 1; //Columna del 1 al 5
  //- Cuando el usuario nos pasa los numeros de la fila y columna del 1 al 5 a la hora de hacer la comprovacion de su disparo y la posicion del barco hay que tener en cuenta que si nosotros tenemos iBarco fila = 0 y iBarcoCol = 3 y el nos pasa fila = 1 y col = 3 es correcto, ja que hay que iBarcoFila va de 0 al 4 y lo que tenemos que hacer es restar 1 al la fila del usuario.

} 

// Lucia
int disparar (char cMatriz[6][6], int fila, int columna, int barcoFila, int barcoCol, int result){
  result = 0; // El result s'utilitzarà per a que més abaix poguem saber si imprimir si s'ha enfonsat o no
  fila -= 1;
  
  // Si conicideix el input del user amb la posició del vaixell
  // printf("%d, %d, %d, %d\n", fila, barcoFila, columna, barcoCol);
  
  if (fila == barcoFila && columna == barcoCol) {
      cMatriz[fila][columna] = 'x';
      result = 1;
  } else{
      cMatriz[fila][columna] = 'o';
  }
  return result;
}

int main(){
  char cMatriz[6][6];
  int iBarcoFila, iBarcoCol, iFila, iCol, iResult = 0, iTurnos = 10;

  /* FASE 1 */
  crearMapa(cMatriz);
  mostrarTabla(cMatriz); // Creamos el elinterior del mapa y lo mostramos
  imprimirTabla(cMatriz);
  
  /* FASE 2 */
  insertarBarco(cMatriz, &iBarcoFila, &iBarcoCol);
  printf("Actual: x = %d & y = %d\n", iBarcoFila + 1, iBarcoCol); 
  /*
    - Mostramos de manera temporal donde esta el braco para testing, le estamos sumado 1 
    al iBarcoFila porque como es del 0 al 4 hay que mostralo como si fuera del 1 al 5.
  */

  do{
     /* FASE 3 */
    printf("\n> Donde quieres atacar?\n");
    printf("Introdueix la fila (1 al 5): ");
    scanf("%d", &iFila);

    if (iFila < 1 || iFila > 5){
      printf("Has introducido una fila inexistente\n");
      continue;
    }

    printf("Introdueix la columna (1 al 5): ");
    scanf("%d", &iCol);

    if (iCol < 1 || iCol > 5){
      printf("Has introducido una fila inexistente\n");
      continue;;
    }


    /* FASE 4 */
    iResult = disparar(cMatriz, iFila, iCol, iBarcoFila, iBarcoCol, iResult);
    imprimirTabla(cMatriz);

    /* FASE 5 */
    if (iResult == 0){
      printf("Has fallado\n");
    } else if (iResult == 1){
      printf("Felicidades has ganado con %d restantes.\n", iTurnos);
    }
    iTurnos--;
  }while(iResult != 1);
 
  return 0;
}