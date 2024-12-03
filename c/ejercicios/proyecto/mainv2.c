#include <stdio.h>
#include <time.h>
#include <stdlib.h>

/* Funciones Necesarias */

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
void mostrarTabla(char cMatriz[6][6]){
  for (int i = 0; i < 6; i++) { //fila
    for (int j = 0; j < 6; j++) { //columna
      if (j == 0) {
        cMatriz[i][j] = (char)(i + '1'); // cada vez que la j (columnas) sea 0, la columna, el valor de la fila sera el numero de fila (i) + '1' es necesario sumer '1', porque se esta pasando un numero a char, de tal forma que empieza en el primer caracter del codigo ASCI y por lo tanto el resultado daria simbolos aleatorios. Por lo tanto se pone 1 porque se quiere empezar en este
      } else if (i == 5){
        cMatriz[i][j] = (char)(j+'0'); // Cuando se llegue a la ultima fila, las columnas se iran actualizando. Al igual que en el anterior se suma '0'. En este caso es 0, porque la columna 0 no nos hace falta, queremos que la columna 1 se muestre el 1
      }
    }
  }
}

// Jhonny
void insertarBarco (char cMapa[6][6], int *iBarcoFila, int *iBarcoCol) {
  srand((unsigned)time(NULL));
  *iBarcoFila = (rand() % 5); // Fila del 0 al 4
  *iBarcoCol = (rand() % 5) + 1; //Columna del 1 al 5

  //Esta funcon genera dos numeros aleatorios con rand a partir del time() para la posicion del barco,
  //en iBarcoFila obtenemos un numero del 0 al 4 y en iBarcoCol obtenemos un numero del 1 al 5.
} 

// Lucia
int disparar (char iMatriz[6][6], int fila, int col, int barcoFila, int barcoCol, int result){
  result = 0; // ponemos el result a 0, para que por defecto devuelva que no coinciden (FALSE) y en caso de que si, mas adelante actualizamos
  fila -= 1; // Se le resta uno porque el indice en la matriz en la fila empieza en 0. No es necesario restar en la columna, porque el barcocol sera un numero entre 1 y 5, que equivale a los valores que va a introducir el usuario
  printf("X: %d - %d, Y: %d - %d \n", fila, barcoFila, col, barcoCol);

  if (fila == barcoFila && col == barcoCol){ // Si coincide, la matriz en pos [fila][col] se pondra como X(tocado)
    iMatriz[fila][col] = 'X';
    result = 1; // Sirve para luego hacer condicional para imprimir si el barco se a tocado o se tiene que volver a intentar
  } else{
    iMatriz[fila][col] = 'O'; // En caso de que no coincida, se pone en la posicion [fila][columna una O]
  }

  return result; // se devuelve el resultado, para después usarlo en la funcion main
}

/*  Funciones Extra */
//Jhonny
void imprimirTabla (char iMatriz[6][6]) {
  for (int i = 0; i < 6; i++){ //
    for (int j = 0; j < 6; j++){
      printf("%c ", iMatriz[i][j]);
    }
    printf("\n");
  }
}

void obtenerDatos(int iTurnos, int *iFila, int *iCol){ 
  // Funcion para obtener los datos de la columna i la fila del usuario
  printf("Turnos restante %d\n", iTurnos); // Mostramos los turnos restantes que tiene el usuario
  printf("Donde quieres atacar?\n"); 

  do { 
    printf("> Introdueix la fila (1 al 5): ");
    scanf("%d", iFila);

    if (*iFila < 1 || *iFila > 5){
      printf("\033[1;31mHas introducido una fila inexistente, vuelve a introducirlo: \033[0m\n");
    }
  }while (*iFila < 1 || *iFila > 5);
  

  do{
    printf("> Introdueix la columna (1 al 5): ");
    scanf("%d", iCol);

    if (*iCol < 1 || *iCol > 5){
      printf("\033[1;31mHas introducido una fila inexistente, vuelve a introducirlo: \033[0m\n");
    }
  }while(*iCol < 1 || *iCol > 5);  

  //Ponemos la pregunta de los valores de fila y columna dentro de un do while para que si equivoca le muestre une error y le pida 
  //volver a introducir los valores.   
}

void imprimirPosicionBarcoActual(int iBarcoFila, int iBarcoCol){
  printf("Actual: x = %d & y = %d\n", iBarcoFila + 1, iBarcoCol); 
  /*
    - Mostramos de manera temporal donde esta el braco para testing, le estamos sumado 1 
    al iBarcoFila porque como es del 0 al 4 hay que mostralo como si fuera del 1 al 5 para 
    que coincida con lo obtedio del usurio.
  */
}

//Jhonny
int main(){
  char cMatriz[6][6];
  int iBarcoFila, iBarcoCol, iFila, iCol, iResult = 0, iTurnos = 10;

  //FASE 1
  //Creamos el mapa y insertamos el mar del interior
  crearMapa(cMatriz);
  mostrarTabla(cMatriz); 
  imprimirTabla(cMatriz);
  
  //FASE 2
  // Obtenemos la posiscion del barco en las variables del iBarco* a traves de punteros
  insertarBarco(cMatriz, &iBarcoFila, &iBarcoCol);
  imprimirPosicionBarcoActual(iBarcoFila, iBarcoCol); // Imprimir posicion para testing del programma

  do{
    //FASE 3
    //Pedimos datos al usuario
    obtenerDatos(iTurnos, &iFila, &iCol);

    //FASE 4
    //Con los datos del usuario hacemos el disparo y imprimimos el mapa y como hs resultado.
    iResult = disparar(cMatriz, iFila, iCol, iBarcoFila, iBarcoCol, iResult); 
    imprimirTabla(cMatriz);

    //FASE 5
    //Comprovamos a traves del return de disparar() "que es 0 o 1" en iResult si hemos ganado o no 
    if (iResult == 0){
      printf("Has fallado!\n");
    } else if (iResult == 1){
      printf("Felicidades has ganado con %d restantes!\n", iTurnos);
    }
    
    iTurnos--;

    if(iTurnos == 0){
      printf("Se han acabado los turnos, has perdidio!\n");
      break;
    }

  }while(iResult != 1); //Tenemos el do while() para que el usuario pueda disparar hasta que gane o se acaben los turnos

  return 0;
}