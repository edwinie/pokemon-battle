 boolean playerTurn = true;
  ArrayList<Pokemon> team1 = new ArrayList<Pokemon>();
  ArrayList<Pokemon> team2 = new ArrayList<Pokemon>();
  pokemonCharmander Charmander = new pokemonCharmander();
  pokemonSquirtle Squirtle = new pokemonSquirtle();
  pokemonBulbasaur Bulbasaur = new pokemonBulbasaur();
  pokemonEevee Eevee = new pokemonEevee();
  pokemonPikachu Pikachu = new pokemonPikachu();
  pokemonMewtwo Mewtwo = new pokemonMewtwo();
  Trainer player = new Trainer("Sasuke", team1);
  Trainer gymLeader = new Trainer("Itachi", team2);
  final int OVERWORLD = 0;
  final int BATTLE = 1;
  final int START_SCREEN = 2;
  int gameState = START_SCREEN;
  boolean battleOver = false;
  String battleMessage;
  final int TILE_SIZE = 32;
  final int MAP_WIDTH = 20;
  final int MAP_HEIGHT = 15;
  int playerX = 9;
  int playerY = 12;
  int trainerX = 9;
  int trainerY = 2;
  final int playerturn = 0;
  final int playerresult = 1;
  final int opponentturn = 2;
  final int opponentresult = 3;
  int battleState = playerturn;
  String moveResultMessage = "";
  String moveResult = "";
  String movement = "Forward";
  String startScreenMessage = "";
 
  int[][] map = 
  {
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
  {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
  {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
  {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
  {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
  {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
  {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
  {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
  {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
  {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
  {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
  {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
  {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
  {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
};
 
 
  public void drawOverworld(){
    final int TILE_SIZE = 32;
    final int MAP_WIDTH = 20;
    final int MAP_HEIGHT = 15;
    gameState = OVERWORLD;
    for (int y = 0; y < MAP_HEIGHT; y++) {
      for (int x = 0; x < MAP_WIDTH; x++) {
        drawTile(map[y][x], x * TILE_SIZE, y * TILE_SIZE);
      }
    }
    if (movement == "Forward"){
      PImage player = loadImage("Forward.png");
      player.resize(32,32);
      image(player,playerX * TILE_SIZE,playerY * TILE_SIZE);
    }
    
    if (movement == "Backward"){
      PImage player = loadImage("Backward.png");
      player.resize(32,32);
      image(player,playerX * TILE_SIZE,playerY * TILE_SIZE);
    }
    
    if (movement == "Left"){
      PImage player = loadImage("Leftward.png");
      player.resize(32,32);
      image(player,playerX * TILE_SIZE,playerY * TILE_SIZE);
    }
    
    if (movement == "Right"){
      PImage player = loadImage("Rightward.png");
      player.resize(32,32);
      image(player,playerX * TILE_SIZE,playerY * TILE_SIZE);
    }
    
    
    PImage opponent = loadImage("Trainer.png");
    opponent.resize(32,32);
    image(opponent,trainerX * TILE_SIZE,trainerY * TILE_SIZE);
  }

  public void drawTile(int tileType, int x, int y) {
    if (tileType == 0) {
      PImage tree = loadImage("Tree.png");
      tree.resize(32,32);
      image(tree,x,y);
    }
    
    else if (tileType == 1) {
      PImage grass = loadImage("Grass.png");
      grass.resize(32,32);
      image(grass,x,y);
    }
  }
 
  boolean checkTrainerProximity() {
  int dx = abs(playerX - trainerX);
  int dy = abs(playerY - trainerY);
  return (dx + dy == 1);
  }

 
  public void drawBattle(Trainer opponent, Trainer player){
    textSize(20);
    if (player.getTeamNumber() == 0 || opponent.getTeamNumber() == 0) {
      delay(2000);
      battleOver = true;
      if (player.getTeamNumber() == 0) {
        battleMessage = "You lost the battle!";
      } else {
        fill(0);
        battleMessage = "You won the battle!";
      }
        text(battleMessage, 230,230);
    } else {
    fill(0);
    PImage background = loadImage("Background.png");
    background.resize(640,380);
    image(background,0,0);
    text(opponent.getPokemon().getName(), 50 , 50);
    text("HP: " + opponent.getPokemon().getHP(), 50, 80);
    text(player.getPokemon().getName(), 400 , 300);
    text("HP: " + player.getPokemon().getHP(), 400, 330);
    drawHealthBar(player.getPokemon(), 400, 350);
    drawHealthBar(opponent.getPokemon(), 50, 100);
    PImage playerP = loadImage(player.getPokemon().getName() + "B.png");
    playerP.resize(250,250);
    image(playerP,66,200);
    PImage opponentP = loadImage(opponent.getPokemon().getName() + "F.png");
    opponentP.resize(250,250);
    image(opponentP,350,50);
   fill(255);
   rect(0,380,640,100);
   fill(0);
    textSize(15);
     if (battleState == 0) {
    text("1. " + player.getPokemon().getMove1(), 50, 410);
    text("2. " + player.getPokemon().getMove2(), 50, 430);
    text("3. " + player.getPokemon().getMove3(), 350, 410);
    text("4. " + player.getPokemon().getMove4(), 350, 430);
    } else if (battleState == 1 || battleState == 3) {
       if (opponent.getPokemon().getHP() <= 0){
        moveResultMessage += opponent.getPokemon().getName() + " fainted.";
      opponent.removeTeam();
      text(moveResult, 50, 440);
    }
    if (player.getPokemon().getHP() <= 0){
      moveResultMessage += player.getPokemon().getName() + " fainted.";
      player.removeTeam();
      text(moveResult, 50, 440);
    }
        text(moveResultMessage, 10, 410);
    }
  }
  }
 
  public void drawHealthBar(Pokemon pokemon, int x, int y) {
    fill(0);
    rect(x, y, 100, 10);
    float healthPercentage = (float) pokemon.getHP() / pokemon.getMaxHP();
    if (healthPercentage > 0.5){
    fill(0, 255, 0);
    } else {
      fill(255, 0, 0);
    }
    rect(x, y, healthPercentage * 100, 10);
}

  void opponentTurn() {
    int move = int(random(1, 5));
    Pokemon pokemon = gymLeader.getPokemon();
    if (move == 1) {
      moveResultMessage = pokemon.move1(player.getPokemon());
    } else if (move == 2) {
      moveResultMessage = pokemon.move2(player.getPokemon());
    } else if (move == 3) {
      moveResultMessage = pokemon.move3();
    } else if (move == 4) {
      moveResultMessage = pokemon.move4();
    }
  }
 
  void keyPressed() {
     if (gameState == START_SCREEN) {
    if (key == '1') {
      addPokemonToTeam(new pokemonCharmander());
    } else if (key == '2') {
      addPokemonToTeam(new pokemonBulbasaur());
    } else if (key == '3') {
      addPokemonToTeam(new pokemonSquirtle());
    } else if (key == '4') {
      addPokemonToTeam(new pokemonEevee());
    } else if (key == '5') {
      addPokemonToTeam(new pokemonPikachu());
    } else if (key == 'q') {
      setDifficulty(1);
    } else if (key == 'w') {
      setDifficulty(2);
    } else if (key == 'e') {
      setDifficulty(3);
    }
     }
   else if (gameState == OVERWORLD) {
      if (keyCode == LEFT) {
        if (playerX > 0) {
          playerX--;
         movement = "Left";
        }
      }
      else if (keyCode == RIGHT) {
        if (playerX < MAP_WIDTH - 1) {
          playerX++;
          movement = "Right";
        }
      }
      else if (keyCode == UP) {
        if (playerY > 0) {
          playerY--;
          movement = "Forward";
        }
      }
      else if (keyCode == DOWN) {
        if (playerY < MAP_HEIGHT - 1) {
          playerY++;
          movement = "Backward";
        }
      }
    } else if (gameState == BATTLE) {
    if (battleState == 0 && battleOver == false) {
            if (key == '1') {
                moveResultMessage = player.getPokemon().move1(gymLeader.getPokemon());
                battleState = 1;
            } else if (key == '2') {
                moveResultMessage = player.getPokemon().move2(gymLeader.getPokemon());
                battleState = 1;
            } else if (key == '3') {
                moveResultMessage = player.getPokemon().move3();
                battleState = 1;
            } else if (key == '4') {
                moveResultMessage = player.getPokemon().move4();
                battleState = 1;
            }
        } else if (battleState == 1) {
            battleState = 2;
        } else if (battleState == 2) {
            opponentTurn();
            battleState = 3;
        } else if (battleState == 3) {
            battleState = 0;
        }
    }
  }
  
  void setup(){
    size(640, 480);
  }
 
  void draw() {
  background(255);
 
  if (gameState == START_SCREEN) {
    drawStartScreen();
  } else if (gameState == OVERWORLD) {
    drawOverworld();
    if (checkTrainerProximity()) {
      gameState = BATTLE;
    }
  } else if (gameState == BATTLE) {
    drawBattle(gymLeader, player);
  }}
 
 void drawStartScreen() {
  fill(0);
  textSize(20);
  text("Choose your Pokémon (press 1-5):", 10, 30);
  text("1. Charmander", 10, 60);
  PImage im = loadImage("CharmanderF.png");
    im.resize(50,50);
    image(im,130,30);
  text("2. Bulbasaur", 10, 90);
  PImage im2 = loadImage("BulbasaurF.png");
    im2.resize(50,50);
    image(im2,130,60);
  text("3. Squirtle", 10, 120);
  PImage im3 = loadImage("SquirtleF.png");
    im3.resize(50,50);
    image(im3,130,90);
  text("4. Eevee", 10, 150);
  PImage im4 = loadImage("EeveeF.png");
    im4.resize(50,50);
    image(im4,130,120);
  text("5. Pikachu", 10, 180);
  PImage im5 = loadImage("PikachuF.png");
    im5.resize(50,50);
    image(im5,130,150);
  text(startScreenMessage, 10, 210);
  text("Choose difficulty (press Q, W, E):", 10, 240);
  text("Q: Easy", 10, 270);
  text("W: Medium", 10, 300);
  text("E: Hard", 10, 330);
}

void addPokemonToTeam(Pokemon pokemon) {
  if (player.team.size() < 6) {
    player.team.add(pokemon);
    startScreenMessage = "Added " + pokemon.getName() + " to your team.";
  } else {
    startScreenMessage = "Your team is full!";
  }
}

void setDifficulty(int level) {
  if (player.team.size() > 0) {
    gameState = OVERWORLD;
    startScreenMessage = "Difficulty set to " + level;
    if (level == 1){
      gymLeader.team.add(new pokemonCharmander());
      gymLeader.team.add(new pokemonBulbasaur());
      gymLeader.team.add(new pokemonSquirtle());
    } else if (level == 2){
      gymLeader.team.add(new pokemonCharmander());
      gymLeader.team.add(new pokemonBulbasaur());
      gymLeader.team.add(new pokemonSquirtle());
      gymLeader.team.add(new pokemonPikachu());
      gymLeader.team.add(new pokemonEevee());
    } else if (level == 3){
      gymLeader.team.add(new pokemonMewtwo());
    }
  } else {
    startScreenMessage = "Add at least one Pokémon to your team!";
  }
}


 
