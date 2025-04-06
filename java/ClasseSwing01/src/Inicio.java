import javax.swing.*;
import java.awt.*;


public class Inicio extends JFrame{

  public Inicio (){
    setTitle("Programma Prinicpal");
    setSize(500, 500);
    setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

    JPanel panel = new JPanel();
    JLabel etiqueta = new JLabel("Bienvenido a mi programa");
    JButton btn = new JButton("Ir al formulario");
    btn.addActionListener((e) -> {
      //ACCION AL TOCAR EL BOTON
      dispose();
      new Formulario();
    });

    panel.add(etiqueta);
    panel.add(btn);
    add(panel);
    setVisible(true);

  }
}
