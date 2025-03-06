public class Electronics extends Producto implements Operaciones{
  public Electronics (String nomProducte, double preu){
    super(nomProducte, preu);
  }
  @Override
  public void registrar(){
    System.out.println("Electronic: " + super.getNomProducte() + " (Creado)");

  }
  @Override
  public void eliminar(){
    System.out.println("Electronic: " + super.getNomProducte() + " (Eliminado)");

  }
  @Override
  public void mostrarProducte(){
    System.out.println("Electronic: " + super.getNomProducte() + "(Preu = " + super.getPreu() + ")");
  }
}
