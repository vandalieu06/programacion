public class Triangulo extends Figuras{
  public Triangulo(double base, double altura){
    super(base, altura);
  }
  @Override
  public double calcularArea(){
    return (getBase() * getAltura())/2;
  }
}
