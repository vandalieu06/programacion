import java.util.ArrayList;
import java.util.Scanner;

/* Implementar arraylist de estudiantes
 * Menu
 *  - Agregar estudiante
 *  - Mostrar lista estudiantes
 *  - Mostrar estudiantes con mejor nota
 *  - Ordenar estudiantes por nota y mostrarlos
 *  - eliminar estudiante por nombre
 *  - Salir
 *  */

public class Gestor {

  private void menuOpciones(){
    System.out.println("MENU (v0.1)");
    System.out.println("1. Agregar estudiante");
    System.out.println("2. Mostrar lista de estudiantes");
    System.out.println("3. Mostrar estudiante con mejor nota");
    System.out.println("4. Mostrar estudiantes ordenados por nota (DESC)");
    System.out.println("5. Eliminar estudiante");
    System.out.println("6. Salir");
  }
  private int pedirDatos(){
    Scanner scanner = new Scanner(System.in);
    return scanner.nextInt();
  }
  private void menuAplicaciones(int iOpcion){
    switch (iOpcion)
      case 1:
        System.out.println("Hola mundo");
        break;
  }


  public void start(){
    int iOpcion = 0;
    ArrayList<Estudiante> estudiantes = new Estudiante<>();
    do {
      menuOpciones();
      System.out.print("Introduce una opción: ");
      iOpcion = pedirDatos();
      menuAplicaciones(iOpcion);

    } while (iOpcion < 0 || iOpcion > 7);
  }
}
