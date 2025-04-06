

public class Main {
  public static void main(String[] args) {
    new Inicio();
  }
}

/*FlowLayout -->  LEFT, CENTER, RIGHT
*   panel.setLayout(new FLowLayout(FlowLayout.LEFT|RIGHT|CENTER));
* BorderLayout --> NORTH, SOUTH, EAST, WEST, CENTER
*   panel.setLayout(new BorderLayout);
*   panel.add(btn, BorderLayout.NORTH|SOUTH|EAST|WEST|CENTER)
* GridLayout -- Filas y columnas y espacio entre ellas
*   panel.setLayout(new GridLayout(3, 2, 10, 10))
* BoxLayout --> Fila x y Columna x
*   panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));
* GridBagLayout
*   panel.setLayout(new GridLayoutBagLayout());
* */