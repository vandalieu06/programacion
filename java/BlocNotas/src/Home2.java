import javax.swing.*;
import javax.swing.filechooser.FileNameExtensionFilter;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Arrays;
import java.util.Scanner;

public class Home2 {
  public JFrame frameHome;
  public JMenuBar menuBar;
  public JMenu menuCategory1, menuCategory2;
  public JMenu menuCategory23, menuCategory24;
  public JMenuItem menuCategory21, menuCategory22;
  public JMenuItem menuitem11, menuitem12, menuitem13;
  public JMenuItem menuitem2_font1, menuitem2_font2, menuitem2_font3, menuitem2_font4, menuitem2_font5;
  public JMenuItem menuitem2_fontweight1, menuitem2_fontweight2;
  public JMenuItem menuitem2_background1, menuitem2_background2, menuitem2_background3, menuitem2_background4, menuitem2_background5;
  public JTextArea textNote;

  private void createFrame(){
    frameHome = new JFrame();
    //Si el componente es nulo la ventana se coloca en el centro de la pantalla.
    frameHome.setLocationRelativeTo(null);
    frameHome.setTitle("Bloc de Notas");
    frameHome.setSize(600, 500);
    frameHome.setResizable(false);
    frameHome.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    frameHome.setLayout(new GridLayout(1, 1));

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
    menuCategory21 = new JMenuItem("Font de Text");
    menuCategory22 = new JMenuItem("Escoge Color");
    menuCategory23 = new JMenu("Peso Texto");
    menuCategory24 = new JMenu("Cambiar Fondo");

    menuCategory2.add(menuCategory21);
    menuCategory2.add(menuCategory22);
    menuCategory2.add(menuCategory23);
    menuCategory2.add(menuCategory24);


    //Ponemos a disposion los dos tipos de peso de texto
    menuitem2_fontweight1 = new JMenuItem("Normal");
    menuitem2_fontweight2 = new JMenuItem("Negrita");
    menuCategory23.add(menuitem2_fontweight1);
    menuCategory23.add(menuitem2_fontweight2);

    //Assignammos los tipos de fondos disponibles (colores claros )
    menuitem2_background1 = new JMenuItem("Gris Claro");
    menuitem2_background2 = new JMenuItem("Rosa Claro");
    menuitem2_background3 = new JMenuItem("Azul Claro");
    menuitem2_background4 = new JMenuItem("Purpura Claro");
    menuitem2_background5 = new JMenuItem("Blanco");
    Arrays.asList(menuitem2_background1, menuitem2_background2, menuitem2_background3, menuitem2_background4, menuitem2_background5)
            .forEach(menuCategory24::add);
  }

  private void createTextArea(){
    textNote =  new JTextArea();
    //Cuando el texto tqoeu el borde haga un salto de linea
    textNote.setLineWrap(true);
    //Añadimo margenes alrededor del TextArea para que el texto no toque los bordes
    textNote.setMargin(new Insets(20,20, 20, 20));
    //Definimos la fuente de texto por defecto
    textNote.setFont(new Font("Arial", Font.PLAIN, 12));

    // Envolver el JTextArea en un JScrollPane para tener un scroll del en el TextArea
    JScrollPane scrollPane = new JScrollPane(textNote);
    scrollPane.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_ALWAYS); // Scroll vertical siempre visible

    // Añadimo el scrollPane en el contenedor
    frameHome.add(scrollPane);
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

  private void changeColors(){
    Color colorSeleccionado = Color.BLACK;
    colorSeleccionado = JColorChooser.showDialog(null, "Elige un color", colorSeleccionado);
    if (colorSeleccionado == null){
      colorSeleccionado = Color.BLACK;
      JOptionPane.showMessageDialog(null, "No has escogido ningun color, se pondra el predeterminado.");
    }
    textNote.setForeground(colorSeleccionado);
  }

  private void changeFontStyle(){
    String[] fuentes = GraphicsEnvironment.getLocalGraphicsEnvironment().getAvailableFontFamilyNames();

    String selectedFont = (String) JOptionPane.showInputDialog(
            null,
            "Selecciona una fuente:",
            "Cambiar Fuente",
            JOptionPane.PLAIN_MESSAGE,
            null,
            fuentes,
            textNote.getFont().getFamily()
    );

    if (selectedFont != null) {
      textNote.setFont(new Font(selectedFont, Font.PLAIN, textNote.getFont().getSize()));
    }
  }

  private void changeBackgroundColor(ActionEvent e){
    if (e.getSource() == menuitem2_background1){
      textNote.setBackground(new Color(187, 186, 186, 56));
    } else if (e.getSource() == menuitem2_background2) {
      textNote.setBackground(new Color(239, 123, 235, 153));
    } else if (e.getSource() == menuitem2_background3) {
      textNote.setBackground(new Color(37,156,196, 139));
    } else if (e.getSource() == menuitem2_background4) {
      textNote.setBackground(new Color(125, 9, 133, 61));
    } else if (e.getSource() == menuitem2_background5) {
      textNote.setBackground(new Color(255, 255, 255));
    }
  }

  private void assignEventsComponents(){
    //Evento para la opción de guardar archivo
    menuitem11.addActionListener((e) -> saveFileViaExplorer());
    //Evento para la opción de abrir archivo
    menuitem12.addActionListener((e) -> openFileViaExplorer());
    //Cerrar programa llamando el metodo dispose() del frame
    menuitem13.addActionListener((e) -> {
      frameHome.dispose();
    });
    //Añadimos evento para las fuente de texto
    menuCategory21.addActionListener((e) -> changeFontStyle());

    //Añadimos evento para los colores del texto
    menuCategory22.addActionListener((e) -> changeColors());

    //Assignamos los evento de las opciones de peso de fuente
    menuitem2_fontweight1.addActionListener((e) -> {
      //Obtenemos el actual estilo y a traves del metodo deriveFont() cambiamos
      //el estilo (weight) del texto.
      textNote.setFont(textNote.getFont().deriveFont(Font.PLAIN));
    });
    menuitem2_fontweight2.addActionListener((e) -> {
      textNote.setFont(textNote.getFont().deriveFont(Font.BOLD));
    });

    //Asignamos el canvio de color del fondo a las opciones
    menuitem2_background1.addActionListener(this::changeBackgroundColor);
    menuitem2_background2.addActionListener(this::changeBackgroundColor);
    menuitem2_background3.addActionListener(this::changeBackgroundColor);
    menuitem2_background4.addActionListener(this::changeBackgroundColor);
    menuitem2_background5.addActionListener(this::changeBackgroundColor);


  }

  public Home2(){
    //Se crea la ventana principal con las propiedades por defecto
    createFrame();
    //Creamos el menu y asignamos las opciones predeterminadas
    createMenu();
    //Creamos el TextARea de manera temporal con unos margenes en la escritura
    createTextArea();
    //Asignamos eventos a las opciones
    assignEventsComponents();
    //Mostramos los componentes en la ventana
    frameHome.setVisible(true);

  }

}
