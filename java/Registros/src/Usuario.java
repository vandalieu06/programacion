public abstract class Usuario {
  private String nom;
  static int id = 0; //identificador

  public Usuario (String nom){
    this.nom = nom;
    id++;
  }

  public String getNom() {
    return nom;
  }
  public int getId() {
    return id;
  }

  public abstract void mostrarDatos();
  public void saludar(){
    System.out.println("Hola desde la classe Usuario. (Mensaje Genérico)");
  }
}
