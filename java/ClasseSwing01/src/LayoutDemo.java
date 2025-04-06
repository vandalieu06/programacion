import javax.swing.*;
import java.awt.*;

public class LayoutDemo {
  public static void main(String[] args) {
    SwingUtilities.invokeLater(() -> {
      new LayoutDemo().createAndShowGUI();
    });
  }

  private void createAndShowGUI() {
    JFrame frame = new JFrame("Ejemplo de Layouts en Java");
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    frame.setSize(600, 400);
    frame.setLayout(new BorderLayout(12, 12));

    // Panel con BorderLayout
    JPanel borderPanel = new JPanel(new BorderLayout());
    borderPanel.setBorder(BorderFactory.createTitledBorder("BorderLayout"));
    borderPanel.add(createColoredPanel("Norte", Color.RED), BorderLayout.NORTH);
    borderPanel.add(createColoredPanel("Sur", Color.BLUE), BorderLayout.SOUTH);
    borderPanel.add(createColoredPanel("Este", Color.GREEN), BorderLayout.EAST);
    borderPanel.add(createColoredPanel("Oeste", Color.ORANGE), BorderLayout.WEST);
    borderPanel.add(createColoredPanel("Centro", Color.YELLOW), BorderLayout.CENTER);

    // Panel con FlowLayout
    JPanel flowPanel = new JPanel(new FlowLayout());
    flowPanel.setBorder(BorderFactory.createTitledBorder("FlowLayout"));
    flowPanel.add(createColoredPanel("1", Color.PINK));
    flowPanel.add(createColoredPanel("2", Color.CYAN));
    flowPanel.add(createColoredPanel("3", Color.MAGENTA));

    // Panel con GridLayout
    JPanel gridPanel = new JPanel(new GridLayout(2, 2, 5, 5));
    gridPanel.setBorder(BorderFactory.createTitledBorder("GridLayout"));
    gridPanel.add(createColoredPanel("A", Color.LIGHT_GRAY));
    gridPanel.add(createColoredPanel("B", Color.DARK_GRAY));
    gridPanel.add(createColoredPanel("C", Color.BLACK));
    gridPanel.add(createColoredPanel("D", Color.WHITE));

    // Panel con BoxLayout (Vertical)
    JPanel boxPanel = new JPanel();
    boxPanel.setLayout(new BoxLayout(boxPanel, BoxLayout.Y_AXIS));
    boxPanel.setBorder(BorderFactory.createTitledBorder("BoxLayout (Vertical)"));
    boxPanel.add(createColoredPanel("X", Color.RED));
    boxPanel.add(Box.createVerticalStrut(10)); // Espaciado
    boxPanel.add(createColoredPanel("Y", Color.GREEN));
    boxPanel.add(Box.createVerticalStrut(10)); // Espaciado
    boxPanel.add(createColoredPanel("Z", Color.BLUE));

    // Agregar los paneles al frame principal
    frame.add(borderPanel, BorderLayout.CENTER);
    frame.add(flowPanel, BorderLayout.NORTH);
    frame.add(gridPanel, BorderLayout.WEST);
    frame.add(boxPanel, BorderLayout.EAST);

    frame.setVisible(true);
  }

  private JPanel createColoredPanel(String text, Color color) {
    JPanel panel = new JPanel();
    panel.setBackground(color);
    panel.add(new JLabel(text));
    return panel;
  }
}
