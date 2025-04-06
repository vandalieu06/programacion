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
    ArrayList<Integer> botColors = new ArrayList<>();
    ArrayList<JPanel> colorPanels = new ArrayList<>();
    colorPanels.add(sColor1);
    colorPanels.add(sColor2);
    colorPanels.add(sColor3);
    colorPanels.add(sColor4);

    for (int i = 0; i < 4; i++) {
      int numRandom = (int) (Math.random() * 4);
      botColors.add(numRandom);
    }

    int delay = 1500; //Tenemos en cuenta el tiempo en que al inicio se ocultan los colores de los paneles

    for (int num : botColors) { // Recorremos el array de numeros aleatorios y lo guaradamos en num
      JPanel tmpPanel = colorPanels.get(num); // A partir del array de numeros aleatorios obtenemos el panel de los colores
      showColorTimer(delay, tmpPanel); // Enviamos el delay y el panel del color
      delay += 1000; // Aumentamos en 1000 ms que es lo que se tarda en mostrar y ocultar el panel
    }
  }

  public void userBtns(){
    Arrays.asList(btn1, btn2, btn3, btn4).forEach(pBtns::add);
    btn1.doClick();
  }


  public Game() {
    createFrame();
    createContainers();
    addContent();
    frame.setVisible(true);
    opaqueColors();
    startSimon();
  }

}
