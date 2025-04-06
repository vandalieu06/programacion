import javax.swing.*;
import java.awt.*;

public class FormularioEjemplo {
  public static void main(String[] args) {
    SwingUtilities.invokeLater(() -> {
      new FormularioEjemplo().createAndShowGUI();
    });
  }

  private void createAndShowGUI() {
    JFrame frame = new JFrame("Formulario con GridBagLayout");
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    frame.setSize(400, 300);
    frame.setLocationRelativeTo(null); // Centra la ventana

    // Panel principal con GridBagLayout
    JPanel panel = new JPanel(new GridBagLayout());
    panel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));

    GridBagConstraints gbc = new GridBagConstraints();
    gbc.fill = GridBagConstraints.NONE; // Evitaz que se estiren
    gbc.anchor = GridBagConstraints.WEST; // Alineación a la izquierda
    gbc.insets = new Insets(5, 5, 5, 5); // Espaciado entre componentes

    // Elementos del formulario
    JLabel nameLabel = new JLabel("Nombre:");
    JTextField nameField = new JTextField(15);

    JLabel emailLabel = new JLabel("Correo:");
    JTextField emailField = new JTextField(15);

    JCheckBox subscribeCheckBox = new JCheckBox("Suscribirse al boletín");

    JButton submitButton = new JButton("Enviar");

    // Agregar componentes al panel con restricciones
    gbc.gridx = 0; gbc.gridy = 0; panel.add(nameLabel, gbc);
    gbc.gridx = 1; gbc.gridy = 0; panel.add(nameField, gbc);

    gbc.gridx = 0; gbc.gridy = 1; panel.add(emailLabel, gbc);
    gbc.gridx = 1; gbc.gridy = 1; panel.add(emailField, gbc);

    gbc.gridx = 0; gbc.gridy = 2; gbc.gridwidth = 2;
    gbc.anchor = GridBagConstraints.CENTER; // Centrar checkBox
    panel.add(subscribeCheckBox, gbc);

    gbc.gridx = 0; gbc.gridy = 3; gbc.gridwidth = 2;
    panel.add(submitButton, gbc);

    frame.add(panel);
    frame.setVisible(true);
  }
}
