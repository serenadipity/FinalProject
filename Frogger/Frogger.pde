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
boolean bound1, bound2;

int savedTime;
int totalTime;

void setup() {
  size(560, 560);
  dim = 60;
  bound2 = false;
  bound1 = true;
  savedTime = millis();
  player = new Player(width/2 - dim/2, width - dim,dim,dim);
  asteroid = new Asteroid(100,400,dim,dim);
  asteroid2 = new Asteroid(200, 400, dim, dim);
  asteroid3 = new Asteroid(300, 400, dim, dim);
  asteroid4 = new Asteroid(400, 400, dim, dim);
  asteroid5 = new Asteroid(150, 300,dim,dim);
  asteroid6 = new Asteroid(250, 300, dim, dim);
  asteroid7 = new Asteroid(350, 300, dim, dim);
  asteroid8 = new Asteroid(450, 300, dim, dim);
  asteroid9 = new Asteroid(100, 200,dim,dim);
  asteroid10 = new Asteroid(200, 200, dim, dim);
  asteroid11 = new Asteroid(300, 200, dim, dim);
  asteroid12 = new Asteroid(400, 200, dim, dim);
  asteroid13 = new Asteroid(150, 100,dim,dim);
  asteroid14 = new Asteroid(250, 100, dim, dim);
  asteroid15 = new Asteroid(350, 100, dim, dim);
  asteroid16 = new Asteroid(450, 100, dim, dim);
  base1 = new Base("earth.png", 80, 450, 400, 400);
  base2 = new Base("mars.png", 80,-450,400,400);
  bg = loadImage("space.png");
  bg.resize(560,560);
}

void makeAsteroids(Asteroid a, float vel, float vel2) {
float x = moveAX(a.xpos, vel, vel2);
  a.xpos = x;
  a.display(x,a.ypos);
}

float moveAX(float pos, float vel, float vel2) {
//working back and forth but all simultaneously
  if (pos < 25) {
    bound2 = true;
    bound1 = false;
  }
  if (pos > 535) {
    bound1 = true;
    bound2 = false;
  }
  
  if (bound1) {
    return pos - vel;
  }
  else {
    return pos - vel2;
  }
}

  

  

void keyPressed()
{
  switch (keyCode) {
    case UP:
       player.moveup();
      break;
    //case DOWN:
     // player.movedown();
      //break;
    case LEFT:
      player.moveleft(player.tileSize);
      break;
    case RIGHT:
      player.moveright();
      break;
  }
}

void attach(Asteroid a){
    float k = player.xcor - a.xpos;
    if (k <= 30) {
      player.xcor = a.xpos;
    } 
    //else {}//dead
      
}
 

/*
void attach(Asteroid a){
    player.xcor = a.xpos;
    player.ycor = a.ypos;
}
*/

void draw() {
  int passedTime = millis() - savedTime;
  if (passedTime > totalTime) {
    text(passedTime, 20,20);
  }
  background(bg);
  base1.display(80,450);
  base2.display(80,-300);
  makeAsteroids(asteroid, 0.5, -0.5);
  makeAsteroids(asteroid2, 0.5, -0.5);
  makeAsteroids(asteroid3, 0.5, -0.5);
  makeAsteroids(asteroid4, 0.5, -0.5);
  makeAsteroids(asteroid5, 1, -1);
  makeAsteroids(asteroid6, 1, -1);
  makeAsteroids(asteroid7, 1, -1);
  makeAsteroids(asteroid8, 1, -1);
  makeAsteroids(asteroid9, 0.75, -0.75);
  makeAsteroids(asteroid10, 0.75, -0.75);
  makeAsteroids(asteroid11, 0.75, -0.75);
  makeAsteroids(asteroid12, 0.75, -0.75);
  makeAsteroids(asteroid13, 1.5, -1.5);
  makeAsteroids(asteroid14, 1.5, -1.5);
  player.display(player.xcor, player.ycor);
  
  if (player.ycor == 400) {
    if (player.collision(asteroid)) {
      attach(asteroid);
    }
    if (player.collision(asteroid2)) {
      attach(asteroid2);
    }
    if (player.collision(asteroid3)) {
      attach(asteroid3);
    }
    if (player.collision(asteroid4)) {
      attach(asteroid4);
    }

  }
  
    if (player.ycor == 300) {
    if (player.collision(asteroid5)) {
      attach(asteroid5);
    }
    if (player.collision(asteroid6)) {
      attach(asteroid6);
    }
    if (player.collision(asteroid7)) {
      attach(asteroid7);
    }
    if (player.collision(asteroid8)) {
      attach(asteroid8);
    }

  }
  
    if (player.ycor == 200) {
    if (player.collision(asteroid9)) {
      attach(asteroid9);
    }
    if (player.collision(asteroid10)) {
      attach(asteroid10);
    }
    if (player.collision(asteroid11)) {
      attach(asteroid11);
    }
    if (player.collision(asteroid12)) {
      attach(asteroid12);
    }

  }
  
  if (player.ycor == 100) {
    if (player.collision(asteroid13)) {
      attach(asteroid13);
    }
    if (player.collision(asteroid14)) {
      attach(asteroid14);
    }
  }
  /*
  if (player.collision(asteroid)) {
    player.moveleft(0.5);
    attach(asteroid);
  }
   if (player.collision(asteroid2)) {
    player.moveleft(0.5);
    attach(asteroid2);
  }  
  */
  player.win(base2);
}
