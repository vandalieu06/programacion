import javax.swing.*;
import java.util.List;
import java.util.Scanner;

public class Instrumento {
  private String tipo;
  private Integer numeroInventario;
  private String propietario;
  public Instrumento (){
  }
  //Metodos
  public void create(){
    System.out.println("Creando instrumento nuevo...");
    Scanner myScanner = new Scanner(System.in);
    System.out.printf("Introduce el tipo de instrumento (flauta, tambor, trombon): ");
    String tipoUser = myScanner.nextLine();
    if (!tipoUser.equals("flauta") && !tipoUser.equals("tambor") && !tipoUser.equals("trombon")) {
      System.out.println("Tipo de instrumento no valido, introduce uno correcto.");
      return;
    }
    System.out.printf("Introduce el nuemro de inventario (0 a 100): ");
    Integer numeroInventarioUser = myScanner.nextInt();

    if(numeroInventarioUser < 0 || numeroInventarioUser > 100 ){
      System.out.println("El numero introducido es incorrecto. \nVuelve a intentarlo");
      return;
    }
    myScanner.nextLine(); // Limpiar del buffer el caracter "/n" que se genera despues de una scanner.nextInt();
    System.out.printf("Introduce el nombre del propietario (max 100): ");
    String propietarioUser = myScanner.nextLine();
    if (propietarioUser.length() > 100){
      System.out.println("El nombre introducido es superior a 100 caracteres.");
      return;
    }

    this.tipo = tipoUser;
    this.numeroInventario = numeroInventarioUser;
    this.propietario = propietarioUser;
  }
  public void list(){
    System.out.printf("El instrumento tipo %s con un total de %d disponible de %s.\n", tipo, numeroInventario, propietario);
  }
}
