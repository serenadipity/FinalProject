Player player;
Asteroid asteroid;

void setup() {
  size(500, 500);
  player = new Player(100,100,80,80);
  asteroid = new Asteroid(0,0,80,80);
}

void makeAsteroids(Asteroid a) {
  a.display();
}
/*
  void keyPressed() {
    if (key == CODED) {
      if(keyCode == UP) {
        player.movePlayer(0,-1);
      } else if (keyCode == DOWN) {
        player.movePlayer(0, 1);
      } else if (keyCode == LEFT) {
        player.movePlayer(-1, 0);
      } else if (keyCode == RIGHT) {
        player.movePlayer(1, 0);
      }
    } else if (key == ' ') {
      player.movePlayer(0, 0);
    }
  }
*/
void keyPressed()
{
  switch (keyCode) {
    case UP:
       player.moveup();
      break;
    case DOWN:
      player.movedown();
      break;
    case LEFT:
      player.moveleft();
      break;
    case RIGHT:
      player.moveright();
      break;
  }
}

void draw() {
  background(47,47,79);
  makeAsteroids(asteroid);
  player.display();
}
