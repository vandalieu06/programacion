public class Ability{
  private String name;
  private int damage;
  private int health;

  public Ability (String name, int damage){
    this.name = name;
    this.damage = damage;
  }
  public Ability (String name, int damage, int condition){
    this.name = name;
    this.damage = damage;
    this.health = condition;
  }
  public String getName(){
    return name;
  }
  public int getDamage(){
    return damage;
  }
  public int getHealth(){
    return health;
  }

  public void useAbility (){
    if (health < 0){
      System.out.printf("You have used the skill %s and caused %d DMG and lost %d health.\n", name, damage, health);
      return;
    }
    System.out.printf("You have used the skill %s and caused %d DMG and recovered %d health.\n", name, damage, health);
  }
}
