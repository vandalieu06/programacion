import javax.swing.*;
import java.awt.*;

public class Formulario extends JFrame {
  public Formulario (){
    setTitle("Ventana Formulario");
    setSize(500, 500);
    setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

    JPanel panel = new JPanel();
    panel.setLayout(new GridLayout(5, 1));

    JLabel etiqueta = new JLabel("Formulario");

    JButton btn = new JButton("Volver");
    btn.setAlignmentX(Component.CENTER_ALIGNMENT);

    String[] frutas = {"Manzana","Pera","Tomate"};
    JComboBox combofrutas = new JComboBox(frutas);

    /*ComboBOx favorita
    * Slider para indicar vuestro nivel
    * Boton volver
    * */
    btn.addActionListener((e) -> {
      //ACCION AL TOCAR EL BOTON
      dispose();
      new Inicio();
    });

    panel.add(etiqueta);
    panel.add(combofrutas);
    panel.add(btn);
    add(panel);
    setVisible(true);
  }
}
