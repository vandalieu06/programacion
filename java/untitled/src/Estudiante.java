public class Estudiante {
  private double nota;
  private String nom;
  public Estudiante(String nom, double nota){
    this.nom = nom;
    this.nota = nota;
  }

  public String getNom() {
    return nom;
  }

  public double getNota() {
    return nota;
  }
}
