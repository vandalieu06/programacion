#include <stdio.h>
#include <time.h>
#include <stdlib.h>

/* Funciones Necesarias - NO SE PUEDEN EDITAR*/

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

  if (fila == barcoFila && col == barcoCol){ // Si coincide, la matriz en pos [fila][col] se pondra como X(tocado)
    iMatriz[fila][col] = 'X';
    result = 1; // Sirve para luego hacer condicional para imprimir si el barco se a tocado o se tiene que volver a intentar
  } else{
    iMatriz[fila][col] = 'O'; // En caso de que no coincida, se pone en la posicion [fila][columna una O]
  }

  return result; // se devuelve el resultado, para después usarlo en la funcion main
}


/* --------------------------------------------------------------- */

/*  Funciones Extra -- SE PUEDE EDITAR */
//Menu nivel de dificultades
void menuOpciones(int *iOpcion){
  printf("Menu opciones\n");
  printf("1. Escoger nivel de dificultad\n");
  printf("2. Salir\n");
  printf("Escoge una opcion: ");
  scanf("%d", iOpcion);
}

//Menu de nivel de dificultad
void menuNiveles(int *iNivelDificultad ){
  printf("\nNiveles disponbles: \n");
  printf("- 1. Facil (se generan 5 barcos)\n");
  printf("- 2. Normal (se generan 3 barcos)\n");
  printf("- 3. Dificil (se genera 1 barcos)\n");
  printf("Escoge un nivel: ");
  scanf("%d", iNivelDificultad);
}

//Funcion para imprimir la tabla
void imprimirTabla (char cMatriz[6][6]) {
  for (int i = 0; i < 6; i++){ //
    for (int j = 0; j < 6; j++){
      printf("%c ", cMatriz[i][j]);
    }
    printf("\n");
  }
}

// Funcion para obtener los datos de la columna i la fila del usuario
void obtenerDatos(int iTurnos, int *iFila, int *iCol){ 
  printf("Turnos restante %d\n", iTurnos); // Mostramos los turnos restantes que tiene el usuario
  printf("Donde quieres atacar?\n"); 

  do { 
    printf("> Introdueix la fila (1 al 5): ");
    scanf("%d", iFila);

    if (*iFila < 1 || *iFila > 5){
      printf("\033[1;31mHas introducido una fila incorrecta, vuelve a introducirlo: \033[0m\n");
    }
  }while (*iFila < 1 || *iFila > 5);
  
  do{
    printf("> Introdueix la columna (1 al 5): ");
    scanf("%d", iCol);

    if (*iCol < 1 || *iCol > 5){
      printf("\033[1;31mHas introducido una columna incorrecta, vuelve a introducirlo: \033[0m\n");
    }
  
  }while(*iCol < 1 || *iCol > 5);  

  //Ponemos la pregunta de los valores de fila y columna dentro de un do while para que si equivoca le muestre une error y le pida 
  //volver a introducir los valores.   
}

//Compravar si el disparo es en un sito que ha ha sido atacado
int comprobarDisparo (char cMapa[6][6], int iFila, int iCol){
  int iRespuesta = 0; //False
  if (cMapa[iFila - 1][iCol] == 'O'){
    iRespuesta = 1; //True
  }
  return iRespuesta;
}



void iniciarProgramma (char cMatriz[6][6], int iNivelDificultad, int *iSaliendo){
  //Variables
  int iFila, iCol; //Fila y columa del atacante
  int iBarcosMapa; //Barcos en el mapa
  int iResult = 0, iTurnos = 10; //Resultado true o false y turnos restantes 
  int iPoiscionActualIgual; // Si el lugar ha sido atacado
  int iBarcoFila, iBarcoCol; // Fila y columna genera aleatoriamente

  //Fase 1 - Creamos el array enacragdo de guardar las posiciones de los barcos en el mapa 
  if (iNivelDificultad == 1){
    iBarcosMapa = 5;
  } else if (iNivelDificultad == 2){
    iBarcosMapa = 3; 
  } else if (iNivelDificultad == 3){
    iBarcosMapa = 1;
  }
  
  int iBarcosFilas[iBarcosMapa], iBarcosCols[iBarcosMapa]; //Creamos las fila i columnas del barco segun la dificulat escogida 

  //Fase 2 - Creamos el mapa y insertamos el mar del interior
  crearMapa(cMatriz);
  mostrarTabla(cMatriz); 
  imprimirTabla(cMatriz);

  //Fase 3 - Obtenemos la posiscion del barco en las variables del iBarco* a traves de punteros
  printf("Insertando los barcos...\n");
  for (int i = 0; i < iBarcosMapa; i++){
    insertarBarco(cMatriz, &iBarcoFila, &iBarcoCol);
    if (i != 0){
      while(iBarcoFila == iBarcosFilas[i - 1] && iBarcoCol == iBarcosCols[i - 1]){
        insertarBarco(cMatriz, &iBarcoFila, &iBarcoCol);
      }
    }
    iBarcosFilas[i] = iBarcoFila;
    iBarcosCols[i] = iBarcoCol;
  }

  // Testing de los barcos
  // for (int i = 0; i < iBarcosMapa; i++){
  //   printf("Barco %d: %d, %d \n", i + 1, iBarcosFilas[i] + 1, iBarcosCols[i]);
  // }


  do{
    //Fase 4 - Pedimos datos al usuario
    obtenerDatos(iTurnos, &iFila, &iCol);

    //Fase 5 - Con los datos del usuario hacemos el disparo y imprimimos el mapa y como ha resultado.
    iPoiscionActualIgual = comprobarDisparo(cMatriz, iFila, iCol);
    if (iPoiscionActualIgual == 1) {
      printf("\033[1;31mEl lugar disparadao ya ha sido atacado, vuleve a intentarlo (no pierdes turno)!\033[0m\n");
      imprimirTabla(cMatriz);
      continue;
    }
    
    for (int i = 0; i < iBarcosMapa; i++){
      iResult = disparar(cMatriz, iFila, iCol, iBarcosFilas[i], iBarcosCols[i], iResult); 
      if (iResult == 1){
        break;
      }
    }

    imprimirTabla(cMatriz);

    //Fase 6 - Comprovamos a traves del return de disparar() "que es 0 o 1" en iResult si hemos ganado o no 
    if (iResult == 0){
      printf("Has fallado!\n");
    } 
    char cSeguirJugando[2];
    if (iResult == 1){
      printf("Felicidades has ganado con %d restantes!\n", iTurnos);
      printf("Quieres Seguir jugando (y o n)? ");
      scanf(" %c", cSeguirJugando);

      if (cSeguirJugando[0] == 'n'){
        *iSaliendo = 0;
        printf("Saliendo...\n");
      } else if (cSeguirJugando[0] == 'y') {
        *iSaliendo = 1;
        printf("Continuar partida...\n");
      } 
    }

    iTurnos--;

    if(iTurnos == 0){
      printf("Se hanfdj acabado los turnos, has perdidio!\n");
      break;
    }
  }while(iResult != 1); //Tenemos el do while() para que el usuario pueda disparar hasta que gane o se acaben los turnos

}

int main(){
  printf("Comenzando programma...\n");
  //Variables 
  int iOpcion = 1, iNivelDificultad = 1, iSaliendo = 11;
  char cMatriz[6][6];

  while (iSaliendo != 0){
    menuOpciones(&iOpcion); //Mostramos en el menu de ocpiones y obtenemos la opcion del usuario
    switch (iOpcion) {
      case 1:
        menuNiveles(&iNivelDificultad); //Mostramos los niveles disponibles y obtenemos la dificultad
        iniciarProgramma(cMatriz, iNivelDificultad, &iSaliendo); //Iniciamos el programa segun el nivel de dificultad
        break;
      case 2: 
        printf("Saliendo...\n");
        iSaliendo = 0;
        break;
      default:
        printf("La opcion escogida no es correct, vuelve a intentarlo!\n");
    }
  };
  
  return 0;
}