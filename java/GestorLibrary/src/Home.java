import javax.swing.*;
import java.awt.*;
import java.net.URL;

public class Home {
    private JFrame homeFrame = new JFrame("Biblioteca");
    private JPanel contentFrame = new JPanel();
    private JPanel boxButtons = new JPanel();
    private JLabel title = new JLabel("Bienvenido a mi humilde Gestor");
    private JLabel imageLbl;
    private JButton btnGestor, btnConsult, btnExit;
    private Icon myImgIcon;
    private URL imageURL;

    private void initFrame(){
        homeFrame.setSize(800, 500);
        homeFrame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        homeFrame.setLocationRelativeTo(null);
        homeFrame.setResizable(false);
    }

    private void initComponents(){
        // Content BOX
        contentFrame.setLayout(new BorderLayout(10, 10));
        contentFrame.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));

        // Titulo
        title.setFont(new Font("", Font.PLAIN, 30));
        title.setHorizontalAlignment(SwingConstants.CENTER);

        // Bienvenida con Imagen GIF
        // Para añadir el gif he utilizado lo siguiente:
        // https://stackoverflow.com/questions/12566311/displaying-gif-animation-in-java
        imageURL = this.getClass().getResource("./img.gif");
        myImgIcon = new ImageIcon(imageURL);
        imageLbl = new JLabel(myImgIcon);

        // Botones
        boxButtons.setLayout(new FlowLayout(FlowLayout.CENTER));
        btnGestor = new JButton("Getionar libros");
        btnConsult = new JButton("Consultar libros");
        btnExit = new JButton("Salir");
        boxButtons.add(btnGestor);
        boxButtons.add(btnConsult);
        boxButtons.add(btnExit);

        // Añadir componentes
        contentFrame.add(title, BorderLayout.NORTH);
        contentFrame.add(imageLbl, BorderLayout.CENTER);
        contentFrame.add(boxButtons, BorderLayout.SOUTH);
        homeFrame.add(contentFrame, BorderLayout.CENTER);
    }

    private void addEventsBtns(){
        btnGestor.addActionListener(e -> {
            new Gestor();
            homeFrame.dispose();
        });
        btnConsult.addActionListener(e -> {
            new VistaBooks();
            homeFrame.dispose();
        });
        btnExit.addActionListener(e -> {
            homeFrame.dispose();
        });
    }

    public Home(){
        initFrame();
        initComponents();
        addEventsBtns();
        homeFrame.setVisible(true);
    }
}
