Player player;
Asteroid asteroid;
float dim;
PImage bg;
PImage earth;
PImage mars;
Base base1, base2;

void setup() {
  size(560, 560);
  dim = 60;
  player = new Player(width/2 - dim/2, width - dim,dim,dim);
  asteroid = new Asteroid(300,150,dim,dim);
  base1 = new Base("earth.png", 80, 450, 400, 400);
  base2 = new Base("mars.png", 80,-450,400,400);
  bg = loadImage("space.png");
  bg.resize(560,560);
}

void makeAsteroids(Asteroid a) {
float x = moveAX(a.xpos);
  a.xpos = x;
  a.display(x,a.ypos);
}

float moveAX(float pos) {
  return pos - 0.5;
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
      player.moveleft(player.tileSize);
      break;
    case RIGHT:
      player.moveright();
      break;
  }
}

void attach(){
    player.xcor = asteroid.xpos;
    player.ycor = asteroid.ypos;  
}

void draw() {
  background(bg);
  base1.display(80,450);
  base2.display(80,-300);
  makeAsteroids(asteroid);
  player.display(player.xcor, player.ycor);
  if (player.collision(asteroid)) {
    player.moveleft(0.5);
    attach();
  } 
}
