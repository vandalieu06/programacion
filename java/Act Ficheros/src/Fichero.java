import java.io.FileWriter;
import java.io.IOException;

public class Fichero {
  private String nameFile;

  public void setNameFile(String nameFile) {
    this.nameFile = nameFile;
  }

  public void escribir(String nombre, int nota){
    try{
      FileWriter fichero  = new FileWriter(nameFile);
      fichero.write(nombre + ", " + nota + "\n");
      fichero.close();
    } catch (IOException e){
      System.out.println("Error: " + e.getMessage());
    }

  }

}
