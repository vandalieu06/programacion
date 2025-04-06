import javax.swing.*;
import java.awt.*;


public class Home {
  private JButton createUser, updateUser, deleteUser;
  private JTable tableUsers;
  private JFrame home;

  public void createFrameHome(){
    home.setTitle("Hola Mundo");
    home.setSize(600, 600);
    home.setLocationRelativeTo(null);
    home.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    home.setResizable(false);
    home.setLayout(new BorderLayout(10, 10));
  }

  public void createButtons(){
    createUser = new JButton("Crear");
    updateUser = new JButton("Actualizar");
    deleteUser = new JButton("Eliminar");
  }

  public Home (){
    home = new JFrame();
    createFrameHome();
    createButtons();
    JPanel header = new JPanel(new FlowLayout());
    header.add(deleteUser);
    header.add(createUser);
    header.add(updateUser);
    JPanel content = new JPanel( new GridLayout(1, 1));
    tableUsers = new JTable(10, 4);
    tableUsers.setDefaultEditor(Object.class, null);
    tableUsers.setValueAt("Jhonn", 0, 0);
    tableUsers.setValueAt("Jhonn", 1, 0);
    tableUsers.setValueAt("Jhonn", 2, 0);
    content.add(tableUsers);

    home.add(header, BorderLayout.NORTH);
    home.add(content, BorderLayout.CENTER);
    home.setVisible(true);
  }
}

