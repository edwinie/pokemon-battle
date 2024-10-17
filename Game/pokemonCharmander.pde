class pokemonCharmander extends Pokemon{
  boolean sun;
  
  public pokemonCharmander() {
    super("fire", 39, 60, 50, 65,"Charmander");
  }

  public String move1(Pokemon opponent) {
    opponent.applyDamage(4*this.getAttack()/opponent.getDefense() + 1);
    return getName() + " attacked "+ opponent.getName()  + " and dealt "+ (4*this.getAttack()/opponent.getDefense() + 1) +
      " points of damage with Scratch.";
  }

  public String move2(Pokemon opponent) {
    int damage = 4;
    if (opponent.getType() == "grass") {
      damage = 8;
    } else
    if (opponent.getType() == "water" || opponent.getType() == "fire") {
      damage = 2;
    }
    if (sun) {
      damage = damage*2;
    }
    opponent.applyDamage(damage*this.getAttack()/opponent.getDefense() + 1);
    return getName() + " attacked "+ opponent.getName()  + " and dealt "+ damage +
      " points of damage with Ember.";
  }

  public String move3() {
    this.attack *= 1.5;
    this.speed *= 1.5;
    return getName() + " used Dragon Dance. Charmander's attack and speed rose.";
  }

  public String move4() {
    sun = true;
    return getName() + " uses Sunny Day. The sunlight got bright.";
  }
   public String name(){
    return "Charmander";
  }
  public String getMove1(){
    return "Scratch";
  }
  public String getMove2(){
    return "Ember";
  };
  public String getMove3(){
    return "Dragon Dance";
  };
  public String getMove4(){
    return "Sunny Day";
  };
}
