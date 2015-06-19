Player player;
Asteroid asteroid;

void setup() {
  size(560, 560);
  player = new Player(width/2 - 60/2, width - 60,60,60);
  asteroid = new Asteroid(300,150,60,60);
}

void makeAsteroids(Asteroid a) {
float x = moveAX(a.xpos);
  a.xpos = x;
  a.display(x,a.ypos);
}

float moveAX(float pos) {
  return pos - 1;
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
  if (player.collision(asteroid)) {
  text("game over", 10, 30);
  } 
}
