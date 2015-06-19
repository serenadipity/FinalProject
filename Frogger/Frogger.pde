Player player;
Asteroid asteroid;

void setup() {
  size(560, 560);
  player = new Player(0,0,80,80);
  asteroid = new Asteroid(0,0,80,80);
}

void makeAsteroids(Asteroid a) {
  a.display();
}

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
