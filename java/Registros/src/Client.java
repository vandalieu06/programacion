import java.util.Scanner;

public class Client extends Usuario implements Operaciones{
  public Client(String nom) {
    super(nom);
  }

  @Override
  public void mostrarDatos() {
    System.out.println("Hola desde el usuario llamado " + super.getNom() + " con la id " + super.getId());
  }

  @Override
  public void registrar() {
    System.out.println("Client: " + super.getNom() + " (registrado)");
  }

  @Override
  public void eliminar() {
    System.out.println("Client: " + super.getNom() + " (eliminado)");
  }

}
