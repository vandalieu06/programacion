public class Figuras {
  private double altura;
  private double base;

  public Figuras () {
  }

  public Figuras (double base){
    this.base = base;
  }

  public Figuras (double base, double altura){
    this.altura = altura;
    this.base = base;
  }

  public double getAltura() {
    return altura;
  }

  public double getBase() {
    return base;
  }

  public void showInfo(){
    System.out.println("Altura: " + altura + "\nBase: " + base);
  }
  public double calcularArea(){
    return 0;
  }

}
