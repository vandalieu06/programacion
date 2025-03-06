import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Main {
  private final JTextField textA, textB, textResult;
  private final JButton bSuma;

  public Main() {
    JFrame frame = new JFrame("Mini Calculadora");
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    frame.setSize(300, 200);
    frame.setLayout(new GridLayout(4, 2));

    JLabel labelA = new JLabel("Número 1:");
    textA = new JTextField();

    JLabel labelB = new JLabel("Número 2:");
    textB = new JTextField();

    JLabel labelResult = new JLabel("Resultado:");
    textResult = new JTextField();

    textResult.setEditable(false);

    bSuma = new JButton("Sumar");

    bSuma.addActionListener(new ActionListener() {
      @Override
      public void actionPerformed(ActionEvent e) {
        try {
          int numA = Integer.parseInt(textA.getText());
          int numB = Integer.parseInt(textB.getText());
          int suma = numA + numB;
          textResult.setText(String.valueOf(suma));
        } catch (NumberFormatException ex) {
          textResult.setText("Error");
        }
      }
    });

    frame.add(labelA);
    frame.add(textA);
    frame.add(labelB);
    frame.add(textB);
    frame.add(bSuma);
    frame.add(new JLabel());
    frame.add(labelResult);
    frame.add(textResult);

    frame.setVisible(true);
  }

  public static void main(String[] args) {
    new Main();
  }
}
