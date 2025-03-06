public class Proveeedor extends Usuario implements Operaciones{
  public Proveeedor(String nom) {
    super(nom);
  }

  @Override
  public void mostrarDatos() {
    System.out.println("Hola desde el proveedor llamado " + super.getNom() + " con la id " + super.getId());
  }

  @Override
  public void registrar() {
    System.out.println("Proveedor: " + super.getNom() + " (registrado)");
  }

  @Override
  public void eliminar() {
    System.out.println("Proveedor: " + super.getNom() + " (eliminado)");
  }

}
