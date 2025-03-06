import java.util.ArrayList;
import java.util.Collections;

public class Tienda {
  public Tienda(){}

  public void start(){
    ArrayList<String> nombres = new ArrayList<>();
    nombres.add("Ana");
    nombres.add("Juan");
    nombres.add("Maria");
    nombres.add("El pepe");
    nombres.add("Pepaps");
    System.out.println(nombres.get(0));
    System.out.println(nombres.get(1));
    System.out.println(nombres.get(2));
    System.out.println("Ana esta en la posicion: " + nombres.indexOf("Ana"));//Si no encutra alguana coincidente con el parametro devuelve -1

    Collections.sort(nombres); //Ordenar alfabeticamente
    Collections.reverse(nombres); //Invertir array

    ArrayList<Client> clientes = new ArrayList<>();
    clientes.add(new Client("Juan el Destripador"));
    System.out.println(clientes.getFirst());//.get(0) < .getFirst()

    System.out.println("--------");

    Client cl1 = new Client("Anna Lopez");
    Proveeedor pr1 = new Proveeedor("Sergio Perez");
    Electronics el1 = new Electronics("HP 1000", 35.99);
    Alimentacion al1 = new Alimentacion("Patatas 1KG", 5.99);

    System.out.println("Usuario registrado");
    cl1.mostrarDatos();

    System.out.println("Usuario registrado");
    pr1.mostrarDatos();

    System.out.println("Usuario registrado");
    el1.mostrarProducte();

    System.out.println("Usuario registrado");
    al1.mostrarProducte();

  }
}
