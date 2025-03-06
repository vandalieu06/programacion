public class Archer extends Character {
  public Archer(String name, int level, int life) {
    super(name, level, life);
    setCharacterSkills(0, new Ability("Rain of Arrow", 25));
    setCharacterSkills(1, new Ability("Magic Arrow", 40));
    setCharacterSkills(2, new Ability("Recovery health", 0, 15));
  }

  @Override
  public String getSpecialAction() {
    return "Rain of Arrow";
  }
}
