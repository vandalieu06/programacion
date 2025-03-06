import javax.swing.*;

public class Wizard extends Character{

  public Wizard (String name, int level, int life){
    super(name, level, life);
    setCharacterSkills(0, new Ability("Fire Fall", 25));
    setCharacterSkills(1, new Ability("Explosion", 50, -10));
    setCharacterSkills(2, new Ability("Recovery health", 0, 20));
  }
  @Override
  public String getSpecialAction(){
    return "Explosion";
  }
}
