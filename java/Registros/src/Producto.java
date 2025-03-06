abstract class Producto {
  private String nomProducte;
  private double preu;

  public Producto (String nomProducte, double preu){
    this.nomProducte = nomProducte;
    this.preu = preu;
  }

  public double getPreu() {
    return preu;
  }
  public String getNomProducte() {
    return nomProducte;
  }

  public abstract void mostrarProducte();

}
