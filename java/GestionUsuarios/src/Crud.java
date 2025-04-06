public class Crud {
  Gestor gestor = new Gestor();

  public void createUser(String nombre, String email, int edad){
    gestor.addUser(new Usuario(nombre,email, edad));
  }
  public void deleteUser(int id){
    gestor.deleteUser(id);
  }
  public void updateUser(int id, String nombre, String email, int edad){
    gestor.updateUser(id, nombre, email, edad);
  }

  public Crud(){
  }
}
