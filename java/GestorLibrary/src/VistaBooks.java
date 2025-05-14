import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.util.List;

public class VistaBooks {
    private JFrame frame;
    private JTable bookTable;
    private DefaultTableModel tableModel;
    private JTextField searchField;
    private StorageBook books = StorageBook.getInstance();

    public VistaBooks() {
        initializeFrame();
        createUIComponents();
        loadAllBooks();
        frame.setVisible(true);
    }

    private void initializeFrame() {
        frame = new JFrame("Consulta de Llibres");
        frame.setSize(800, 500);
        frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        frame.setLocationRelativeTo(null);
        frame.setLayout(new BorderLayout(10, 10));
    }

    private void createUIComponents() {
        String[] columnNames = {"Títol", "Autor", "Data", "Estat"};
        tableModel = new DefaultTableModel(columnNames, 0) {
            @Override
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };

        bookTable = new JTable(tableModel);
        bookTable.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        JScrollPane scrollPane = new JScrollPane(bookTable);

        JPanel searchPanel = new JPanel(new FlowLayout(FlowLayout.CENTER));
        searchField = new JTextField(20);
        JButton searchButton = new JButton("Filtrar");
        JButton showAllButton = new JButton("Veure Tots");

        searchButton.addActionListener(this::filterBooks);
        showAllButton.addActionListener(e -> loadAllBooks());

        searchPanel.add(new JLabel("Cercar per títol o autor:"));
        searchPanel.add(searchField);
        searchPanel.add(searchButton);
        searchPanel.add(showAllButton);

        JPanel buttonPanel = new JPanel(new FlowLayout(FlowLayout.CENTER));
        JButton loanButton = new JButton("Préstec");
        JButton returnButton = new JButton("Devolució");
        JButton closeButton = new JButton("Tancar");

        loanButton.addActionListener(e -> {
            int selectedRow = bookTable.getSelectedRow();
            if (selectedRow >= 0) {
                String title = (String) tableModel.getValueAt(selectedRow, 0);
                books.getBooks().stream()
                        .filter(book -> book.getTitle().equals(title))
                        .findFirst()
                        .ifPresent(book -> {
                            book.setState(true);
                            updateTable(books.getBooks());
                        });
            } else {
                JOptionPane.showMessageDialog(frame,
                        "Seleccioneu un llibre per fer el préstec",
                        "Error", JOptionPane.WARNING_MESSAGE);
            }
        });
        returnButton.addActionListener(e -> {
            int selectedRow = bookTable.getSelectedRow();
            if (selectedRow >= 0) {
                String title = (String) tableModel.getValueAt(selectedRow, 0);
                books.getBooks().stream()
                        .filter(book -> book.getTitle().equals(title))
                        .findFirst()
                        .ifPresent(book -> {
                            book.setState(false);
                            updateTable(books.getBooks());
                        });
            } else {
                JOptionPane.showMessageDialog(frame,
                        "Seleccioneu un llibre per fer la devolució",
                        "Error", JOptionPane.WARNING_MESSAGE);
            }
        });
        closeButton.addActionListener(e -> {
            new Home();
            frame.dispose();
        });

        buttonPanel.add(loanButton);
        buttonPanel.add(returnButton);
        buttonPanel.add(closeButton);

        frame.add(searchPanel, BorderLayout.NORTH);
        frame.add(scrollPane, BorderLayout.CENTER);
        frame.add(buttonPanel, BorderLayout.SOUTH);
    }

    private void loadAllBooks() {
        updateTable(books.getBooks());
    }

    private void filterBooks(ActionEvent e) {
        String searchText = searchField.getText().toLowerCase();
        List<Book> filteredBooks = books.getBooks().stream()
                .filter(book -> book.getTitle().toLowerCase().contains(searchText) ||
                        book.getAutor().toLowerCase().contains(searchText))
                .toList();
        updateTable(filteredBooks);
    }

    private void updateTable(List<Book> bookList) {
        tableModel.setRowCount(0);
        for (Book book : bookList) {
            Object[] rowData = {
                    book.getTitle(),
                    book.getAutor(),
                    book.getDate(),
                    book.getState() ? "Prestat" : "Disponible"
            };
            tableModel.addRow(rowData);
        }
    }
}
