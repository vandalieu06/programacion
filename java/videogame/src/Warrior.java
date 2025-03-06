public class Warrior extends Character {
  public Warrior (String name, int level, int life){
    super(name, level, life);
    setCharacterSkills(0, new Ability("Melee Attack", 30, -5));
    setCharacterSkills(1, new Ability("Attack Berserk", 40));
    setCharacterSkills(2, new Ability("Recovery health", 0, 10));
  }
  @Override
  public String getSpecialAction(){
    return "Melee Attack";
  }
}
