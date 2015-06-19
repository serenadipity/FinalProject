Player player;
Asteroid asteroid, asteroid2, asteroid3, asteroid4, asteroid5,
          asteroid6, asteroid7, asteroid8, asteroid9, asteroid10,
          asteroid11, asteroid12, asteroid13, asteroid14,
          asteroid15, asteroid16;
float dim;
PImage bg;
PImage earth;
PImage mars;
Base base1, base2;
boolean isAttached;

void setup() {
  size(560, 560);
  dim = 60;
  player = new Player(width/2 - dim/2, width - dim,dim,dim);
  asteroid = new Asteroid(100,100,dim,dim);
  asteroid2 = new Asteroid(150, 200, dim, dim);
  asteroid3 = new Asteroid(100, 300, dim, dim);
  asteroid4 = new Asteroid(150, 400, dim, dim);
  asteroid5 = new Asteroid(200,100,dim,dim);
  asteroid6 = new Asteroid(250, 200, dim, dim);
  asteroid7 = new Asteroid(200, 300, dim, dim);
  asteroid8 = new Asteroid(250, 400, dim, dim);
  asteroid9 = new Asteroid(300,100,dim,dim);
  asteroid10 = new Asteroid(350, 200, dim, dim);
  asteroid11 = new Asteroid(300, 300, dim, dim);
  asteroid12 = new Asteroid(350, 400, dim, dim);
  asteroid13 = new Asteroid(400,100,dim,dim);
  asteroid14 = new Asteroid(450, 200, dim, dim);
  asteroid15 = new Asteroid(400, 300, dim, dim);
  asteroid16 = new Asteroid(450, 400, dim, dim);
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
  makeAsteroids(asteroid2);
  makeAsteroids(asteroid3);
  makeAsteroids(asteroid4);
  makeAsteroids(asteroid5);
  makeAsteroids(asteroid6);
  makeAsteroids(asteroid7);
  makeAsteroids(asteroid8);
  makeAsteroids(asteroid9);
  makeAsteroids(asteroid10);
  makeAsteroids(asteroid11);
  makeAsteroids(asteroid12);
  makeAsteroids(asteroid13);
  makeAsteroids(asteroid14);
  makeAsteroids(asteroid15);
  makeAsteroids(asteroid16);
  player.display(player.xcor, player.ycor);
  if (player.collision(asteroid)) {
    player.moveleft(0.5);
    attach();
  } 
  player.win(base2);
}
