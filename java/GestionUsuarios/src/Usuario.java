public class Usuario {
  private String nombre;
  private String email;
  private int edad;

  public Usuario (String nombre, String email, int edad){
    this.nombre = nombre;
    this.email = email;
    this.edad = edad;
  }

  public int getEdad() {
    return edad;
  }

  public String getEmail() {
    return email;
  }

  public String getNombre() {
    return nombre;
  }

  public void setEdad(int edad) {
    this.edad = edad;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public void setNombre(String nombre) {
    this.nombre = nombre;
  }
}
