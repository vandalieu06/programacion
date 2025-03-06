import java.util.Scanner;

public class Menu {
  public void options(){
    System.out.println("1. Crear archivo");
    System.out.println("2. Insertar datos");
    System.out.println("3. Leer archivo");
    System.out.println("4. Salir");
  }
  Fichero fichero = new Fichero();

  public void acciones (int opcion){
    Scanner obtenerDatos = new Scanner(System.in);
    switch (opcion) {
      case 1:
        String nameFile = obtenerDatos.nextLine();
        fichero.setNameFile(nameFile);
        break;
      case 4:
        System.out.println("Saliendo");
        break;
    }
  }


  public void init(){
    Scanner obtenerDatos = new Scanner(System.in);
    int turnos = 1;
    do {
      options();
      System.out.print("Selecciona una opción: ");
      int opcionUser = obtenerDatos.nextInt();
      obtenerDatos.nextLine(); //Limpiamos buffer "\n" generado por nextInt().
      if (opcionUser <= 0 || opcionUser >= 4){
        System.out.println("> La opción introducida es incorrecta, vuelve a seleccionar la opción.");
        continue;
      }

      turnos++;
    } while(turnos != 10);
  }
}
