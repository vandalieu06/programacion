import javax.swing.*;
import java.awt.*;
import java.awt.event.ComponentAdapter;
import java.awt.event.ComponentEvent;
import java.util.ArrayList;
import java.util.Arrays;

public class Game {
  private JFrame frame;
  private JPanel pSequence, pBtns;
  private JPanel sColor1, sColor2, sColor3, sColor4;
  private JButton btn1, btn2, btn3, btn4;
  private boolean userTurn = false;
  ArrayList<Integer> botColors = new ArrayList<>();
  ArrayList<Integer> userBtnClicked = new ArrayList<>();
  private int currentLevel = 4;

  public void createFrame(){
    frame = new JFrame();
    frame.setTitle("Simon Cards");
    frame.setSize(500, 500);
    frame.setLocationRelativeTo(null);
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    frame.setResizable(false);
    frame.setLayout(new BorderLayout(10, 10 ));
  }

  public void createContainers(){
    pSequence = new JPanel();
    pSequence.setLayout(new GridLayout(2, 2, 10, 10));
    pSequence.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));

    pBtns = new JPanel();
    pBtns.setLayout(new GridLayout(1, 4));

    frame.add(pSequence, BorderLayout.CENTER);
    frame.add(pBtns, BorderLayout.SOUTH);
  }

  public void addContent(){
    sColor1 = new JPanel();
    sColor1.setBackground(Color.RED);
    sColor1.setPreferredSize(new Dimension(100, 100));
    sColor2 = new JPanel();
    sColor2.setBackground(Color.GREEN);
    sColor2.setPreferredSize(new Dimension(100, 100));
    sColor3 = new JPanel();
    sColor3.setBackground(Color.YELLOW);
    sColor3.setPreferredSize(new Dimension(100, 100));
    sColor4 = new JPanel();
    sColor4.setBackground(Color.BLUE);
    sColor4.setPreferredSize(new Dimension(100, 100));

    Arrays.asList(sColor1, sColor2, sColor3, sColor4).forEach(pSequence::add);

    btn1 = new JButton();
    btn1.setText("ROJO");
    btn2 = new JButton();
    btn2.setText("VERDE");
    btn3 = new JButton();
    btn3.setText("AMARILLO");
    btn4 = new JButton();
    btn4.setText("AZUL");
    Arrays.asList(btn1, btn2, btn3, btn4).forEach(pBtns::add);
  }

  public void opaqueColors() {
    Timer timer = new Timer(1000, event -> {
      Arrays.asList(sColor1, sColor2, sColor3, sColor4).forEach(e -> {
        e.setOpaque(false);
        e.repaint();
      });
    });
    timer.setRepeats(false);
    timer.start();
  }

  private void showColorTimer (int delay, JPanel tmpPanel){
    Timer timer = new Timer(delay, event -> {
      tmpPanel.setOpaque(true);
      tmpPanel.repaint(); // Asegurar actualización gráfica
    });
    timer.setRepeats(false);
    timer.start();

    Timer timerNotVisible = new Timer(delay + 500, event -> {
      tmpPanel.setOpaque(false);
      tmpPanel.repaint(); // Asegurar actualización gráfica
    });
    timerNotVisible.setRepeats(false);
    timerNotVisible.start();
  }

  public void startSimon() {
    ArrayList<JPanel> colorPanels = new ArrayList<>();
    colorPanels.add(sColor1);
    colorPanels.add(sColor2);
    colorPanels.add(sColor3);
    colorPanels.add(sColor4);

    botColors.clear(); // Limpiamos el ArrayList de colores
    //Generamos los numeros que coresponden a un panel/color
    for (int i = 0; i < currentLevel; i++) {
      int numRandom = (int) (Math.random() * 4);
      botColors.add(numRandom);
    }

    int delay = 1500; //Tenemos en cuenta el tiempo en que al inicio se ocultan los colores de los paneles

    for (int num : botColors) { // Recorremos el array de numeros aleatorios y lo guaradamos en num
      JPanel tmpPanel = colorPanels.get(num); // A partir del array de numeros aleatorios obtenemos el panel de los colores
      showColorTimer(delay, tmpPanel); // Enviamos el delay y el panel del color
      delay += 1000; // Aumentamos en 1000 ms que es lo que se tarda en mostrar y ocultar el panel
    }

    // Ejecutamos  el turno del usuario después de mostrar los paneles decolores
    Timer enableUserInput = new Timer(delay, e -> {
      userTurn = true;
      userBtnClicked.clear(); // Limpiamos el array que guarda el buton pulsado del usuario
    });
    enableUserInput.setRepeats(false);
    enableUserInput.start();

  }

  public int btnClicked(JButton btn){
    if (btn == btn1){
      return 0;
    } else if (btn == btn2) {
      return 1;
    } else if (btn == btn3) {
      return 2;
    } else if (btn == btn4) {
      return 3;
    } else {
      return -1;
    }
  }

  public void userBtns(){
    btn1.addActionListener(e -> {
      if (userTurn) {
        int id = btnClicked(btn1);
        userBtnClicked.add(id);
        checkUserSequence();
      }
    });
    btn2.addActionListener(e -> {
      if (userTurn) {
        int id = btnClicked(btn2);
        userBtnClicked.add(id);
        checkUserSequence();
      }
    });
    btn3.addActionListener(e -> {
      if (userTurn) {
        int id = btnClicked(btn3);
        userBtnClicked.add(id);
        checkUserSequence();
      }
    });
    btn4.addActionListener(e -> {
      if (userTurn) {
        int id = btnClicked(btn4);
        userBtnClicked.add(id);
        checkUserSequence();
      }
    });
  }


  private void checkUserSequence() {
    boolean correct = true; // Variable que guarda si la sequencia es la misma

    // Comprovamos una pòr una si los numero guardados en las ArrayList son iguales, si no
    // lo son entonces la variable correct se torna false
    for (int i = 0; i < botColors.size(); i++) {
      if (!userBtnClicked.get(i).equals(botColors.get(i))) {
        correct = false;
        break;
      }
    }

    // Condicional que muestra un JOptionPane para mostrar si la sequencia és
    // correcto o no, ademas si quieres volver a jugar.
    if (correct) {
      int option = JOptionPane.showConfirmDialog(
              frame,
              "¡Correcto! Nivel completado.\n¿Quieres continuar al siguiente nivel?",
              "¡Bien hecho!",
              JOptionPane.YES_NO_OPTION
      );
      // Si volvemos a jugar entonces subimos la cantidad de paneles que se mostraran,
      // indicamos que ya no sera el turno del jugador, limpiamos los los botones pulsados
      // por el usuario, ocultamos los paneles y volvemos a cargar el juego. Sino volvemos a
      // jugar mostramos un mensaje y cerramos la ventana

      if (option == JOptionPane.YES_OPTION) {
        currentLevel++;
        userTurn = false;
        userBtnClicked.clear();
        opaqueColors();
        startSimon(); // Iniciar siguiente nivel
      } else {
        JOptionPane.showMessageDialog(frame, "¡Gracias por jugar!");
        frame.dispose(); // Cerrar el juego
      }

    } else {
      // Si la sequencia no es la misma mostramos un mensaje de GameOver y le preguntamos
      // si quiere volver a intentarlo, se le aplicaran las opciones por defecto.
      int option = JOptionPane.showConfirmDialog(
              frame,
              "¡Incorrecto! Game Over.\n¿Quieres volver a intentarlo?",
              "Fin del juego",
              JOptionPane.YES_NO_OPTION
      );

      if (option == JOptionPane.YES_OPTION) {
        resetGame();
      } else {
        frame.dispose(); // Cerrar el juego
      }
    }
  }

  // Funcion para que el usuario pueda volver a jugar con todas las opciones en default y por defecto
  private void resetGame() {
    botColors.clear();
    currentLevel = 4;
    userBtnClicked.clear();
    userTurn = false;
    opaqueColors();
    startSimon();
  }


  public Game() {
    createFrame();
    createContainers();
    addContent();
    frame.setVisible(true);
    userBtns();
    opaqueColors();
    startSimon();
  }

}
