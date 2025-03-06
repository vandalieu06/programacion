public class Quadrado extends Figuras{
  public Quadrado(double base){
    super(base);
  }
  @Override
  public void showInfo (){
    System.out.println("Base: " + getBase());
  }
  @Override
  public double calcularArea(){
    return (getBase() * getBase());
  }
}
