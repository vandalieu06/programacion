import java.util.ArrayList;

public class StorageBook {
    private static StorageBook instance;
    private ArrayList<Book> books = new ArrayList<Book>();

    public StorageBook() {
        books.add(new Book("The Book", "Juan", "10/06/24", false));
        books.add(new Book("Infinitivo: Generación ", "Jhonny", "11/02/22", false));
        books.add(new Book("¡Cállate, Dragón Malévolo! No quiero tener más hijos contigo. ", "Miquel", "31/01/23", false));
    }

    public static StorageBook getInstance() {
        if (instance == null) {
            instance = new StorageBook();
        }
        return instance;
    }

    public ArrayList<Book> getBooks(){
        return books;
    }

    public Book getBook(int id){
        return books.get(id);
    }

    public void createBook(Book newBook) {
        books.add(newBook);
    }

    public void deleteBook(int id){
        books.remove(id);
    }
}
