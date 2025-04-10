import javax.swing.*;
import java.awt.*;

public class Gestor {
    private JFrame frameGestor = new JFrame("Gestor de Libros");
    private JPanel contentGestor = new JPanel();
    private JPanel boxForm = new JPanel();
    private JPanel boxButtons = new JPanel();
    private JLabel title;
    private JComboBox<String> selectBookList;
    private JButton addBtn, updateBtn, deletenBtn, returnBtn;
    private JLabel selectBook, titleBook, autorBook, dateBook;
    private JTextField inputTitle, inputAutor, inputDate;
    private StorageBook books = StorageBook.getInstance();

    private void initFrame(){
        frameGestor.setSize(800, 500);
        frameGestor.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        frameGestor.setLocationRelativeTo(null);
        frameGestor.setResizable(false);
    }

    private void createForm(){
        boxForm.setLayout(new GridLayout(5, 4, 20, 10));
        selectBook = new JLabel("Selecciona un libro: ");
        titleBook = new JLabel("Titulo: ");
        autorBook = new JLabel("Autor: ");
        dateBook = new JLabel("Fecha: ");

        selectBookList = new JComboBox<String>();
        selectBookList.addItem("Seleccionar...");
        for (int i = 0; i < books.getBooks().size(); i++){
            selectBookList.addItem(books.getBook(i).getTitle());
        }

        selectBookList.addItemListener(e -> {
            int num = selectBookList.getSelectedIndex() - 1;
            inputTitle.setText(books.getBook(num).getTitle());
            inputAutor.setText(books.getBook(num).getAutor());
            inputDate.setText(books.getBook(num).getDate());
        });

        inputTitle = new JTextField();
        inputAutor = new JTextField();
        inputDate = new JTextField();

        boxForm.add(selectBook);
        boxForm.add(selectBookList);
        boxForm.add(titleBook);
        boxForm.add(inputTitle);
        boxForm.add(autorBook);
        boxForm.add(inputAutor);
        boxForm.add(dateBook);
        boxForm.add(inputDate);
    }

    private void initContent(){
        contentGestor.setLayout(new BorderLayout(10, 10));
        contentGestor.setBorder(BorderFactory.createEmptyBorder(10, 50, 10, 50));

        title = new JLabel("Formulario");
        title.setHorizontalAlignment(JLabel.HORIZONTAL);
        title.setFont(new Font("", Font.PLAIN, 30));

        createForm();

        boxButtons.setLayout(new FlowLayout());
        addBtn = new JButton("Añadir");
        updateBtn = new JButton("Actualizar");
        deletenBtn = new JButton("Eliminar");
        returnBtn = new JButton("Volver Inicio");
        boxButtons.add(addBtn);
        boxButtons.add(updateBtn);
        boxButtons.add(deletenBtn);
        boxButtons.add(returnBtn);

        contentGestor.add(title, BorderLayout.NORTH);
        contentGestor.add(boxForm, BorderLayout.CENTER);
        contentGestor.add(boxButtons, BorderLayout.SOUTH);
        frameGestor.add(contentGestor);
    }

    private void addActionButtons(){
        returnBtn.addActionListener(e -> {
            new Home();
            frameGestor.dispose();
        });
    }

    public Gestor() {
        initFrame();
        initContent();
        addActionButtons();
        frameGestor.setVisible(true);
    }
}
