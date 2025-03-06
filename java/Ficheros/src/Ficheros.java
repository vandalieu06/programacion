import java.io.*;
import java.util.Scanner;

public class Ficheros {

  public void escritura (){
    try{
      FileWriter escritura = new FileWriter("fichero.txt");
      escritura.write("Hola\n");
      escritura.write("El mejor portal de anime online para latinoamerica\n");
      escritura.write("Lorem ipsum\n");
      escritura.close();
      System.out.println("El fichero se ha añaddido correctamente");
    } catch (IOException e){
      System.out.println("Error: " + e.getMessage());
    }
  }

  public void lectura(){
    try{
      File fitxer = new File("fichero.txt");
      Scanner leer = new Scanner(fitxer);
      System.out.println("Archivo --> fichero.txt");
      while(leer.hasNextLine()){
        System.out.println(leer.nextLine());
      }
      leer.close();
    }catch (FileNotFoundException e){
      System.out.println("Error: " + e.getMessage());
    }

  }

  public void lecturaBuffer(){
    try {
      BufferedReader lector = new BufferedReader(new FileReader("fichero.txt"));
      System.out.println("Lectura buffer --> fichero.txt");
      String linea;
      while((linea = lector.readLine()) != null){
        System.out.println(linea);
      }
    } catch (IOException i){
      System.out.println("Error: " + i.getMessage());
    }
  }
}
