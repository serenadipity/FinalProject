Player player;
Asteroid asteroid;

void setup() {
  size(560, 560);
  player = new Player(width/2 - 60/2, width - 60,60,60);
  asteroid = new Asteroid(300,150,60,60);
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

void moveAsteroid() {
  float xpos = asteroid.xpos;
  float ypos = asteroid.ypos;
  float move = asteroid.tileSize;
  xpos -= move;
  if ((xpos > width)||(xpos < 0)) {
    xpos = width;
  }
  //image("asteroid.png", xpos, ypos);
}



void draw() {
  background(47,47,79);
  makeAsteroids(asteroid);
  player.display();
  moveAsteroid();
  if (player.collision(asteroid)) {
  text("game over", 10, 30);
  } 
}
