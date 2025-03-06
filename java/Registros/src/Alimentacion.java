public class Alimentacion extends Producto implements Operaciones{
  public Alimentacion(String nomProducte, double preu){
    super(nomProducte, preu);
  }
  @Override
  public void registrar(){
    System.out.println("Alimentacion: " + super.getNomProducte() + " (Creado)");

  }
  @Override
  public void eliminar(){
    System.out.println("ALimentacion: " + super.getNomProducte() + " (Eliminado)");

  }
  @Override
  public void mostrarProducte(){
    System.out.println("ALimentacion: " + super.getNomProducte() + "(Preu = " + super.getPreu() + ")");
  }
}
