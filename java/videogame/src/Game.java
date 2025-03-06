import java.util.Scanner;

public class Game {
  //Contador local de personajes para saber en que posicion de array crear los nuevos personajes.
  public int countCharacter = 0;
  private int limitCharacters = 3; //Limite de personajes que se pueden crear.

  private Character bot = new Warrior("Juan", 1, 120); //Personaje que sera utilizado como bot en el combate

  //Funcion para obtener retornar un numero aleatorio dentro de un rango
  private int getRandom(int min, int max) {
    int range = (max - min) + 1;
    return (int) ((range * Math.random()) + min);
  }

  //Funcion para mostrar el menu de opciones
  private void menuOptions() {
    System.out.println("Game Menu");
    System.out.println("1. Create Characters");
    System.out.println("2. Show Characters");
    System.out.println("3. Combat");
    System.out.println("4. Exit");
  }

  //Funcion que obtienen la array de Characters para mostrar la infomacion de los personajes a partir del metodo con un poco de estilo visual.
  private void showCharacters(Character[] players) {
    System.out.println("List Characters");

    for (int i = 0; i < countCharacter; i++) {
      System.out.println("-------------------------");
      System.out.printf("Character %d\n", i + 1);
      players[i].showInfo();

      if (countCharacter > 1){
        System.out.println(" "); // Condicion para hacer un salto de linea cuando haya mas de 1 personaje creado-
      }
    }
    System.out.println("----------------------");
  }

  //Funcion encargada de crear el personaje a partir de los paramatros obteneidos.
  //Los parametros que recibe es el array d Characters, un STring name que almacena el nombre del personaje y
  //una variable int para ver el tipo de personaje a crear.
  private void createCharacter(Character[] players, String name, int type) {
    //type 1 = "warrior", 2 = "wizard", 3 = "archer"
    if (type == 1){
      players[countCharacter] = new Warrior(name, 1, 120);
    } else if (type == 2) {
      players[countCharacter] = new Wizard(name, 1, 80);
    } else if (type == 3) {
      players[countCharacter] = new Archer(name, 1, 100);
    }
  }

  private boolean turnCharacter(Character player1, Character player2, int skill){
    player1.getCharacterSkills(skill).useAbility();//Mostramos la skill con la que atacamos
    int damage = player1.getCharacterSkills(skill).getDamage();//Daño habilidad
    int health = player1.getCharacterSkills(skill).getHealth();//Curacion habilidad
    int healthUser = player1.getLife();//Vida del personaje
    int maxHealthUser = player1.getMaxLife();//Vida maxima del personaje

    player2.setLife(player2.getLife() - damage);//Restamos a la vida el daño de la habilidad

    if (player1.getLife() <= 0 || player2.getLife() <= 0){
      return false;
    }

    player1.setLife(player1.getLife() + health);

    if(healthUser >= maxHealthUser){//Si la vida es superior a la maxima entonces la vida se fija a la maxima y no en la suma.
      player1.setLife(maxHealthUser);
    }

    return true;
  }

  private void battleCharacters(Character player){
    Scanner myScanner = new Scanner(System.in);
    int turn = 1;
    boolean death = true;
    while (death){
      System.out.printf("---------TURN %d---------\n", turn);
      //Player turn
      player.showInfo();
      player.showCharacterSkills();
      System.out.print("Select Skill: ");
      int skillUser = myScanner.nextInt();
      death = turnCharacter(player, bot, skillUser - 1);

      if (!death){
        System.out.println("END GAME");
        //Si el jugador ha derrotado al bot sube de nivel y recupra la vida, el bot recupera la vida a la maxima para el proximo combate.
        player.levelUp();
        bot.setLife(bot.getMaxLife());
        return;
      }

      System.out.println("----------------------");
      //Bot Turn
      bot.showInfo();
      bot.showCharacterSkills();
      int skillBot = getRandom(0, 2);//Generar un numero aleatorio del 0 al 2
      death = turnCharacter(bot, player, skillBot);

      if (!death){
        System.out.println("END GAME");
        //Si el bot ha derrotado al personaje el bot sube de nivel y con eso recuperoa la vida
        bot.levelUp();
        return;
      }

      //Conditional while
      turn++;
    }
  }

  public void start() {
    Scanner scanner = new Scanner(System.in);
    Character[] players = new Character[limitCharacters];

    System.out.println("Start Game");
    boolean continueLoop = true;
    while (continueLoop) {
      menuOptions();
      System.out.print("Choose a one option (1 to 4): ");
      int optionUser = scanner.nextInt();
      switch (optionUser) {
        case 1:
          //Condicion encargada de revisar si los personajes creados han alcando el limite establecido en la variable.
          if (countCharacter == limitCharacters){
            System.out.println("Limit characters raised.");
            continue;
          }
          //Comienza la creacion de personaje
          System.out.println("Create a new character");
          System.out.print("Select type character (1 Warrior, 2 Wizard, 3 Archer): ");
          int typeUser = scanner.nextInt();
          scanner.nextLine(); //Limpiar el buffer "/n" generado por nextInt()

          System.out.print("Select name character: ");
          String nameUser = scanner.nextLine();
          createCharacter(players, nameUser, typeUser);
          System.out.println("The players have been created.");

          //Obtenemos el numero de personajes creados a traves de la funcion getNumCharacters() de bot ja que al
          //retornar una variable statica el valor es de todos los tipo de personaje, a esta le restamos 1 para que
          //no se cuente el bot y lo asignamos a la varaible count.
          countCharacter = bot.getNumCharacters() - 1;
          break;
        case 2:
          //Le pasamos a la funcion el array players y nos mostrar totdos los personajes creados.
          showCharacters(players);
          break;
        case 3:
          System.out.println("Start Combat");
          //Pedimos y mostramos cuantos personajes hay creados
          System.out.printf("Select a character (available %d): ", countCharacter);
          int playerUser = scanner.nextInt();

          //Condicion para verificar que el numero introduciod por el usuario no inferior a 0 y no es superior al
          //numero actual de personajes creados
          if (playerUser <= 0 || playerUser > countCharacter){
            System.out.println("The character selected not exist!");
            continue;
          }
          //Condicion que verifica que el personaje selcciondo no tiene la vida en 0, o sea que este muerto.
          //Si es el caso indicamos que no se puede utilizar y volvemos al menu.
          if(players[playerUser - 1].getLife() == 0){
            System.out.println("The selected character is death, select another character.");
            continue;
          }

          battleCharacters(players[playerUser - 1]);//Iniciamos el comabte despues de sleccion al personaje
          break;
        case 4:
          System.out.println("Exit...");
          continueLoop = false;
          break;
        default:
          System.out.println("The option selected does not exist, try again.");
      }
    }
  }
}
