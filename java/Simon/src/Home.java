import javax.swing.*;
import java.awt.*;

public class Home {
  private JFrame frame;
  private JPanel home;
  private JLabel message;
  private JButton btnStart;


  public void createFrame(){
    frame = new JFrame();
    frame.setTitle("Simon Cards");
    frame.setSize(500, 500);
    frame.setLocationRelativeTo(null);
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    frame.setResizable(false);
    frame.setLayout(new BorderLayout(10, 10 ));
  }

  public void createContent(){
    // Creamos los elemntos
    message = new JLabel("¡¡Bienvenido al juego de SIMON!!");
    btnStart = new JButton();
    btnStart.setText("JUGAR");
    btnStart.setSize(100, 50);

    // Añadimos los elemntos
    frame.add(message, BorderLayout.CENTER);
    frame.add(btnStart, BorderLayout.SOUTH);
  }

  public void addBtbactions(){
    btnStart.addActionListener(e -> {
      frame.dispose();
      new Game();
    });
  }

  public Home(){
    // Creamos la pantalla
    createFrame();
    // Asignamos el contenido de el la ventana de bienvenida
    createContent();
    //Añadimos eventos a los botones
    addBtbactions();
    // Mostramos la pantalla
    frame.setVisible(true);
  }
}
