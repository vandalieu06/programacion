public class Circulo extends Figuras{
  private double radio;
  private double PI = 3.14;

  public Circulo(double radio){
    this.radio = radio;
  }

  public double getRadio() {
    return radio;
  }

  @Override
  public void showInfo(){
    System.out.println("Radio: " + radio);
  }
  @Override
  public double calcularArea(){
    return (radio * radio) * PI / 2;
  }
}
