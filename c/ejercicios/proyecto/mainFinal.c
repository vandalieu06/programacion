#include <stdio.h>
#include <time.h>
#include <stdlib.h>


void crearMapa (char cMapa[6][6])
{ 
	for (int i = 0; i < 6; i++){ 
		if (i == 5){ 
				return;
		} 
		for (int j = 0; j < 6; j++){ 
			if (j != 0){
				cMapa[i][j] = '~'; //Commilas simple porque es un caracter si fuese varios acaracteres serian commillas dobles 
			}
			else{
				cMapa[i][j] = ' ';
			}
		} 
	} 
}

void mostrarTabla(char iMatriz[6][6]){
	for (int i = 0; i < 6; i++) // filas
	{
		for (int j = 0; j < 6; j++) // columnas
		{
			if (j == 0) 
			{
				iMatriz[i][j] = (char)((i + 1) +'0'); // cada vez que la j (columnas) sea 0, la columna, el valor de la fila sera el numero de fila (i) + '1' es necesario sumer '1', porque se esta pasando un numero a char, de tal forma que empieza en el primer caracter del codigo ASCI y por lo tanto el resultado daria simbolos aleatorios. Por lo tanto se pone 1 porque se quiere empezar en este
			}

			else if (i == 5)
			{
				iMatriz[i][j] = (char)(j +'0'); // Cuando se llegue a la ultima fila, las columnas se iran actualizando. Al igual que en el anterior se suma '0'. En este caso es 0, porque la columna 0 no nos hace falta, queremos que la columna 1 se muestre el 1
			}
		}
	}
}

void insertarBarco (char cMapa[6][6], int *iBarcoX, int *iBarcoY)
{
  //Configuramos los numeros aleatorios
  srand((unsigned)time(NULL));

  *iBarcoX = (rand() % 5) + 1; // Barco posiscion 1 al 5 (Eje x: de izquierda a derecha)
  *iBarcoY = (rand() % 5); // Barco del 0 al 4 (Eje y: de abajo a arriba)
  printf("Actual: x = %d & y = %d\n", *iBarcoX, *iBarcoY); //Mostramos de manera temporal donde esta el braco para testing
} 

int main (){
	//Creamos el mapa de los barcos
  char cMapa[6][6];
  crearMapa(cMapa);

	//Insertamos los numero del mapa
	mostrarTabla(cMapa);
	
	//Obtemeno posicion del barco en el mapa
	int iPosicionBarcoX = 0, iPosicionBarcoY = 0;
  insertarBarco(cMapa, &iPosicionBarcoX, &iPosicionBarcoY);
	
	// Mostrar mapa de manera temporal
	for (int i = 0; i < 6; i++){
    for (int j = 0; j < 6; j++){
      printf("%c ", cMapa[i][j]);
    }
    printf("\n");
  }
	return 0;
}