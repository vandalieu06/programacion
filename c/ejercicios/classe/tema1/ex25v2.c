#include <stdio.h>

int main() {
    int iTotal;
    printf("\n");


    // Imprimir encabezados de las tablas
    for (int i = 1; i <= 10; i++) {
        printf(" Tabla del %d\t", i);
    }
    printf("\n");

    // Imprimir líneas divisorias
    for (int i = 1; i <= 10; i++) {
        printf("-------------\t");
    }
    printf("\n");

    // Imprimir las multiplicaciones
    for (int i2 = 0; i2 <= 10; i2++) {
        for (int i = 1; i <= 10; i++) {
            iTotal = i * i2;
            printf("| %d x %d = %d |\t", i, i2, iTotal);
        }
        printf("\n");
    }

    // Imprimir líneas divisorias al final
    for (int i = 1; i <= 10; i++) {
        printf("-------------\t");
    }
    printf("\n");

    return 0;
}
