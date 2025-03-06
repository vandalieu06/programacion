public class Main {
  public static void main(String[] args) {
    Figuras[] arrayFiguras = new Figuras[3];
    arrayFiguras[0] = new Circulo(8.5);
    arrayFiguras[1] = new Quadrado(4.4);
    arrayFiguras[2] = new Triangulo(10, 15);

    for (int i = 0; i < arrayFiguras.length; i++){
      arrayFiguras[i].showInfo();
      System.out.println("Area: " + arrayFiguras[i].calcularArea() + "m2.");
    }
  }
}