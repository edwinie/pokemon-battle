class pokemonSquirtle extends Pokemon{
  boolean rain;
  
  public pokemonSquirtle(){
    super("water", 44, 50, 64, 43,"Squirtle");
    rain = false;
  }
  
  public String move1(Pokemon opponent){
    opponent.applyDamage(4*this.getAttack()/opponent.getDefense() + 1);
    return getName() + " attacked "+ opponent.getName()  + " and dealt "+ (4*this.getAttack()/opponent.getDefense() + 1) +
    " points of damage with Pound.";
  }

  public String move2(Pokemon opponent){
    int damage = 4;
    if (opponent.getType() == "fire") {
      damage = 8;
    } else if (opponent.getType() == "water" || opponent.getType() == "grass") {
      damage = 2;
    }
    if (rain){
      damage = damage*2;}
    opponent.applyDamage(damage*this.getAttack()/opponent.getDefense() + 1);
    return getName() + " attacked "+ opponent.getName()  + " and dealt "+ damage +
    " points of damage with Water Gun.";
  }

  public String move3(){
    this.defense *= 2;
    return getName() + " used Withdraw. Squirtle's attack rose.";
  }

  public String move4(){
    rain = true;
    return getName() + " uses Rain Dance. It started to rain.";
  }
   public String name(){
    return "Squirtle";
  }
  public String getMove1(){
    return "Pound";
  }
  public String getMove2(){
    return "Water Gun";
  };
  public String getMove3(){
    return "Withdraw";
  };
  public String getMove4(){
    return "Rain Dance";
  };
}
