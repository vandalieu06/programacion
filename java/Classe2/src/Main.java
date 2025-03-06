import java.util.Scanner;

public class Main {
  public static void main(String[] args) {
    /*
    * Le pedimos al usuario numero de instrumentos:
    * Crear instrumentos:
    *   - Pedir los datos al usuario
    *   - Que tipo de instrumento es.
    *   - Crear el instrumento
    * Poder tocar el instrumento que queramos
    * Mostrar la informacion del instrumento
    * */

    Scanner myScanner = new Scanner(System.in);
    Instrumento[] instrumentos = new Instrumento[4];
    Integer indexActual = 0;
    Integer indexUser;
    Boolean continuar = true;
    System.out.println("Proyecto 1");

    while (continuar){
      System.out.println("Menu Opciones");
      System.out.println("1. Crear Instrumento");
      System.out.println("2. Listar Instrumento");
      System.out.println("3. Exit");

      System.out.printf("Selecciona una opcion: ");
      Integer optionUser = myScanner.nextInt();
      myScanner.nextLine(); //Limpiar buffer.

      switch (optionUser){
        case 1:
          instrumentos[indexActual] = new Instrumento();
          instrumentos[indexActual].create();
          break;
        case 2:
          System.out.printf("Que instrumento deseas listar (0 a 3): ");
          indexUser = myScanner.nextInt();
          instrumentos[indexUser].list();
          break;
        case 3:
          System.out.println("Saliendo...");
          continuar = false;
          return;
      }
      if (indexActual < 4){
        indexActual++;
      }

    }
  }
}