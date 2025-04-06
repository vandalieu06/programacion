import java.util.ArrayList;

public class Gestor {
  static ArrayList<Usuario> usuarios = new ArrayList<>();

  public Gestor(){
  }

  public void addUser(Usuario user){
    usuarios.add(user);
  }
  public void deleteUser(int id){
    if (id == 1){
      usuarios.remove(id);
    } else if (id > 1){
      usuarios.remove(id - 1 );
    }
  }

  public void updateUser(int id, String nombre, String email, int edad){
    usuarios.get(id).setNombre(nombre);
    usuarios.get(id).setEmail(email);
    usuarios.get(id).setEdad(edad);
  }

}
