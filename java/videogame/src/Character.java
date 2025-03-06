public class Character {
  private String name;
  private int level;
  private int life;

  //Variables extra
  private int maxLife;
  private String nameAttack;
  private static int numCharacters = 0; // The variable count is created in this class, because the control number characters is better that in the class Game.
  private Ability[] characterSkills = new Ability[3];

  //Methods
  public Character(String name, int level, int life) {
    this.name = name;
    this.level = level;
    this.life = life;
    this.maxLife = life;
    numCharacters++;
  }

  public void setCharacterSkills(int index, Ability ability) {
    characterSkills[index] = ability;
  }

  public int getNumCharacters() {
    return numCharacters;
  }

  public Ability getCharacterSkills(int index) {
    return characterSkills[index];
  }

  public void showCharacterSkills() {
    for (int i = 0; i < characterSkills.length; i++){
      System.out.printf("%d. %s, %d, %d\n", i + 1, characterSkills[i].getName(),characterSkills[i].getDamage(), characterSkills[i].getHealth() );
    }
  }

  public int getMaxLife() {
    return maxLife;
  }

  public int getLife() {
    return life;
  }

  public void setMaxLife(int maxLife) {
    this.maxLife = maxLife;
  }

  public void setLevel(int level) {
    this.level = level;
  }

  public void setLife(int life) {
    this.life = life;
  }

  public void showInfo() {
    System.out.printf("Name: %s\n", name);
    System.out.printf("Level: %d/10\n", level);
    System.out.printf("Life: %d/%d\n", life, maxLife);
  }

  public void levelUp() {
    setLevel(level + 1);
    setLife(maxLife + 5);
    setMaxLife(getLife());
  }

  public String getSpecialAction() {
    return nameAttack;
  }

}
