import javax.swing.*;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.text.Style;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Arrays;
import java.util.Scanner;

public class Home {
  private JFrame frameHome;
  private JMenuBar menuBar;
  private JMenu menuCategory1, menuCategory2;
  private JMenu menuCategory21, menuCategory22;
  private JMenuItem menuitem11, menuitem12, menuitem13;
  private JMenuItem menuitem2_color1, menuitem2_color2, menuitem2_color3,menuitem2_color4, menuitem2_color5;
  private JMenuItem menuitem2_font1, menuitem2_font2, menuitem2_font3, menuitem2_font4, menuitem2_font5;
  private JTextArea textNote;

  private void createFrame(){
    frameHome = new JFrame();
    frameHome.setTitle("Bloc de Notas");
    frameHome.setSize(600, 500);
    frameHome.setResizable(false);
    frameHome.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    frameHome.setVisible(true);
    frameHome.setLayout(new GridLayout(2, 1));
  }

  private void createMenu(){
    //Creamos el menu bar de la parte superior del frame y lo mostramos en el frame
    menuBar = new JMenuBar();
    frameHome.setJMenuBar(menuBar);

    //Creamos las opciones principales del menuBar y las añadimos al menuBar
    menuCategory1 = new JMenu("Arxiu");
    menuCategory2 = new JMenu("Format");
    menuBar.add(menuCategory1);
    menuBar.add(menuCategory2);

    //Creamos las opciones de Arxiu y las asignamos a su classe
    menuitem11 = new JMenuItem("Guardar");
    menuitem12 = new JMenuItem("Obrir");
    menuitem13 = new JMenuItem("Sortir");
    menuCategory1.add(menuitem11);
    menuCategory1.add(menuitem12);
    menuCategory1.add(menuitem13);

    //Creamos las opciones de cambiar fuente y tamaño de texto, y le asignamos
    //opciones predeterminadas
    menuCategory21 = new JMenu("Font de Text");
    menuCategory22 = new JMenu("Cambiar Color");
    menuCategory2.add(menuCategory21);
    menuCategory2.add(menuCategory22);

    // AÑADIR MAS TARDE (Graphics Environment, JOptionPane, JColorChoose)
    //Asignamos las fuentes predeterminadas del cambio de fuente
    menuitem2_font1 = new JMenuItem("Arial");
    menuitem2_font2 = new JMenuItem("Comic Sans");
    menuitem2_font3 = new JMenuItem("Arial");
    menuitem2_font4 = new JMenuItem("Arial");
    menuitem2_font5 = new JMenuItem("Arial");
    Arrays.asList(menuitem2_font1, menuitem2_font2, menuitem2_font3, menuitem2_font4, menuitem2_font5)
            .forEach(menuCategory21::add);

    //Asignamos los colores predeterminados de colores
    menuitem2_color1 = new JMenuItem("Negro");
    menuitem2_color2 = new JMenuItem("Rojo");
    menuitem2_color3 = new JMenuItem("Azul");
    menuitem2_color4 = new JMenuItem("Violeta");
    menuitem2_color5 = new JMenuItem("Gris");
    Arrays.asList(menuitem2_color1, menuitem2_color2, menuitem2_color3, menuitem2_color4, menuitem2_color5)
            .forEach(menuCategory22::add);
  }

  private void createTextArea(){
    textNote =  new JTextArea();
    textNote.setLineWrap(true);
    textNote.setMargin(new Insets(20,20, 20, 20));
    frameHome.add(textNote);
  }

  private void openFileViaExplorer(){
    try{
      JFileChooser fileChooser = new JFileChooser();
      FileNameExtensionFilter filter = new FileNameExtensionFilter("Document file (.txt)", "txt");
      fileChooser.setFileFilter(filter);
      fileChooser.setCurrentDirectory(new File("./files"));

      int result = fileChooser.showOpenDialog(null);

      if (result == JFileChooser.APPROVE_OPTION){
        File selectedFile = fileChooser.getSelectedFile();
        Scanner scannerFile = new Scanner(selectedFile);
        String textFile = "";
        while(scannerFile.hasNextLine()){
          textFile = textFile.concat(scannerFile.nextLine() + "\n");
        }
        textNote.setText(textFile);
      }
    } catch (Exception err){
      JOptionPane.showMessageDialog(null, err.getMessage());
    }
  }

  private void saveFileViaExplorer(){
    try{
      JFileChooser fileChooser = new JFileChooser();
      FileNameExtensionFilter filter = new FileNameExtensionFilter("Document file (.txt)", "txt");
      fileChooser.setFileFilter(filter);
      fileChooser.setCurrentDirectory(new File("./files"));

      int result = fileChooser.showSaveDialog(null);

      if (result == JFileChooser.APPROVE_OPTION){
        String textFile = textNote.getText();
        File selectedFile = fileChooser.getSelectedFile();
        try {
          FileWriter writeFile = new FileWriter(selectedFile.getPath());
          writeFile.write(textFile);
          writeFile.flush();
          writeFile.close();
        }catch (IOException err2){
          JOptionPane.showMessageDialog(null, err2.getMessage());
        }
      }
    } catch (Exception err1){
      JOptionPane.showMessageDialog(null, err1.getMessage());
    }
  }

  private void changeColor(ActionEvent e){
    if (e.getSource() == menuitem2_color1){
      textNote.setForeground(new Color(11,13,10,255));
    } else if (e.getSource() == menuitem2_color2) {
      textNote.setForeground(new Color(230,119,48,255));
    } else if (e.getSource() == menuitem2_color3) {
      textNote.setForeground(new Color(37,156,196));
    } else if (e.getSource() == menuitem2_color4) {
      textNote.setForeground(new Color(65,4,69));
    } else if (e.getSource() == menuitem2_color5) {
      textNote.setForeground(new Color(199,217,221));
    }
  }

  private void changeFontSyle(ActionEvent e){
    if (e.getSource() == menuitem2_font1){
      //GraphicsEnvironment.getLocalGraphicsEnvironment().getAllFonts();
      textNote.setFont(new Font("Arial", Font.PLAIN, 20));
    } else if (e.getSource() == menuitem2_font2) {
      textNote.setFont(new Font("Helvetica", Font.PLAIN, 20));
    } else if (e.getSource() == menuitem2_font3) {
      textNote.setFont(new Font("Times New Roman", Font.PLAIN, 20));
    } else if (e.getSource() == menuitem2_font4) {
      textNote.setFont(new Font("Arial", Font.PLAIN, 20));
    } else if (e.getSource() == menuitem2_font5) {
      textNote.setFont(new Font("Arial", Font.PLAIN, 20));
    }
  }


  private void assignEventsComponents(){
    //Evento para la opción de guardar archivo
    menuitem11.addActionListener((e) -> { saveFileViaExplorer(); });
    //Evento para la opción de abrir archivo
    menuitem12.addActionListener((e) -> { openFileViaExplorer(); });
    //Añadimos evento para las fuente de texto
    menuitem2_font1.addActionListener(this::changeFontSyle);
    menuitem2_font2.addActionListener(this::changeFontSyle);
    menuitem2_font3.addActionListener(this::changeFontSyle);
    menuitem2_font4.addActionListener(this::changeFontSyle);
    menuitem2_font5.addActionListener(this::changeFontSyle);

    //Añadimos evento para los colores del texto
    menuitem2_color1.addActionListener(this::changeColor);
    menuitem2_color2.addActionListener(this::changeColor);
    menuitem2_color3.addActionListener(this::changeColor);
    menuitem2_color4.addActionListener(this::changeColor);
    menuitem2_color5.addActionListener(this::changeColor);
    //menuCategory22.addActionListener(this::changeColor);
  }

  public Home (){
    //Se crea la ventana principal con las propiedades por defecto
    createFrame();
    //Creamos el menu y asignamos las opciones predeterminadas
    createMenu();
    //Creamos el TextARea de manera temporal con unos margenes en la escritura
    createTextArea();
    //Asignamos eventos a las opciones
    assignEventsComponents();
  }

}
