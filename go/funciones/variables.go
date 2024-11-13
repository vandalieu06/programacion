package funciones

import (
	"fmt"
)

func Variables() {
	fmt.Println("-- Variables")
	fmt.Printf("Hola mundo\n")
}

func Loops() {
	fmt.Println("\n-- LOOP FOR") // Println pone un salt de linea (\n) al final del texto
	for i := 0; i < 5; i++ {
		fmt.Printf("Estamos en el ciclo %d\n", i+1) // Similar al printf de C
	}

	fmt.Println("\n-- LOOP FOR WHILE") // Println pone un salt de linea (\n) al final del texto
	for true {
		fmt.Printf("Estamos en el ciclo %d\n", i+1) // Similar al printf de C
	}
}
