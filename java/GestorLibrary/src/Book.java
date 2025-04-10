public class Book {
    private String title;
    private String autor;
    private String date;
    private boolean state; // True -> libre, False -> prestado

    public Book (String title, String autor, String date, boolean state){
        this.title = title;
        this.autor = autor;
        this.date = date;
        this.state = state;
    }

    public String getTitle() {
        return title;
    }

    public String getAutor() {
        return autor;
    }

    public String getDate() {
        return date;
    }
}
