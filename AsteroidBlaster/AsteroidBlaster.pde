
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
int asnum = 13;
Asteroid[] asteroids = new Asteroid[asnum];

int savedTime;
int totalTime;

void setup() {
  size(800, 800);
  dim = 60;
  bound2 = false;
  bound1 = true;
  savedTime = millis();
  player = new Player(width/2 - dim/2, width - dim,dim,dim);
  
  
  for(int i = 0; i < asnum; i++) 
  {
    float x = random(20, width - 20);
    float y = random(100, height - 150);
    
    while(checkOverlap(x, y))
    {
        x = random(20, width - 40);
        y = random(100, height - 150);
    }
    
    asteroids[i] = new Asteroid(x,y,dim,dim,(int)random(3));
  }
  
  base1 = new Base("earth.png", 450, 450, 400, 400);
  base2 = new Base("mars.png", 80,-450,400,400);
  bg = loadImage("space.png");
  bg.resize(width,height);
}

int checkIfOnAsteroid(float x1, float y1)
{
   for(int i = 0; i < asnum;  i++)
   {
      if((x1 > asteroids[i].xpos && x1 < asteroids[i].xpos + dim) && 
        (y1 > asteroids[i].ypos && y1 < asteroids[i].ypos + dim))
      {
        return i;
      }
   }
   return -1;
}

void makeAsteroids(Asteroid a, float vel, float vel2) {
  //float x = moveAX(a.xpos, vel, vel2);
  float x = a.xpos;
  a.xpos = x;
  a.display(x, a.ypos);
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

  
void die() {
  setup();
}
  
/*
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
*/

void attach(Asteroid a){
    float k = player.xcor - a.xpos;
    if (k <= 20) {
      player.xcor = a.xpos;
    } 
    else {
      die();
      text("You Lose. Try again!", 50,50);
      delay(5);
      //die();
    }
}
 
boolean checkOverlap(float x, float y) 
{
  for (int i = 0; asteroids[i] != null && i < asteroids.length; i++) 
  {
     if(asteroids[i].xpos + dim/2.5 > x && asteroids[i].xpos - dim/2.5 < x)
       return true;
     if(asteroids[i].ypos + dim/2.5 > y && asteroids[i].ypos - dim/2.5 < y)
       return true;
  }
  return false;
}

void mousePressed() {
  double distance = distFormula(player.xcor, player.ycor, mouseX, mouseY);
  
  if(player.fuel - distance*0.15 > 0)
  {
    int asteroidNum = checkIfOnAsteroid(mouseX, mouseY);
    if(asteroidNum != -1 && !asteroids[asteroidNum].dead)
    {
      player.fuel -= distance*0.15;
      player.xcor = mouseX - player.tileSize/2;
      player.ycor = mouseY - player.tileSize/2;
      player.money += asteroids[asteroidNum].moneyContent;
      player.fuel += asteroids[asteroidNum].fuelContent;
      asteroids[asteroidNum].changeToDead();
    }
    else if(isOnMars(mouseX, mouseY))
    {
        player.fuel -= distance*0.15;
        player.xcor = mouseX - player.tileSize/2;
        player.ycor = mouseY - player.tileSize/2;
    }
  }
  else
  {
     if (gameOver()) {
       die();
       javax.swing.JOptionPane.showMessageDialog(null, "Game Over!");
     } else{
       javax.swing.JOptionPane.showMessageDialog(null, "You don't have enough fuel!"); 
     }
  }
}

double distFormula(float x1, float y1, float x2, float y2)
{
    return (sqrt((x1 - x2)*(x1 - x2) + (y1 - y2)*(y1 - y2)));
}

boolean gameOver() {
  int far = 0;
  for (int i = 0; i < asnum; i++) {
    if (player.fuel - 0.15*distFormula(player.xcor, player.ycor, asteroids[i].xpos, asteroids[i].ypos) < 0) {
      far += 1;  
    }
  } 
  if (far == asnum) {
    return true; 
  } else {
    return false; 
  }
}

boolean isOnMars(float x1, float y1)
{
   if((x1 > 80 && x1 < 480) && 
        (y1 > 0 && y1 < 100))
   {
       return true;
   }
   return false;
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
  base1.display(width/2 - 200,height - 100);
  base2.display(width/2 - 200, -300);
  text("Fuel: " + Float.toString(player.fuel) + "%", 15, 20);
  text("Money: " + Float.toString(player.money), 15, 35);
  for(int j = 0; j < asteroids.length; j++) {
    makeAsteroids(asteroids[j], 1, -1); 
  }

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
  win(base2);
}

void win(Base b) {
    //if ((this.xcor < b.xpos+200 && this.xcor > b.xpos-200) && (this.ycor < b.ypos+200 && this.xcor > b.ypos-200)) {
      if (player.ycor < 100) {
      javax.swing.JOptionPane.showMessageDialog(null, "You Win!");
      setup();
    }
  }
