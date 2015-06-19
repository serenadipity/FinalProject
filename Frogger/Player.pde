class Player {
  
  PImage rocket;
  float xcor, ycor; //coordinates
  float Height, Width;
  int tileSize;
  
  //Default constructor
  Player() {
    tileSize = 50;
  }
  
  Player(float x, float y, float w, float h) {
    xcor = x;
    ycor = y;
    Height = h;
    Width = w;
    rocket = loadImage("rocket.png");
    rocket.resize((int)w,(int)h);

  }
  
  void display() {
    image(rocket, xcor, ycor);
  }
  
  void movePlayer(int dx, int dy) {
      xcor += dx * tileSize;
      ycor += dy * tileSize;
      image(rocket, xcor, ycor);
  }
  
 //fix moveup 
      public void moveup()
    {
     if (ycor > -10) {
       ycor -= 32;
     //} else {
       //if (test_lily_collision(x)) {
         //if (++score == 5) {
           //win();
         //}
         //xcor = 0;
         //ycor = 640;
       //} else {
         //if (--lives == 0) {
           //setup();
         //} else {
           //x = 0;
           //y = 640;
         //}
       }
     }
    //}
     
    public void movedown()
    {
      if (ycor < 400) {
        ycor += 32;
      }
    }
     
    public void moveleft()
    {
      if (xcor > -12) {
        xcor -= 16;
      }
    }
     
    public void moveright()
    {
      if (xcor < 425) {
        xcor += 16;
      }
    }



  /*
  void keyPressed() {
    if (key == CODED) {
      if(keyCode == UP) {
        movePlayer(0,-1);
      } else if (keyCode == DOWN) {
        movePlayer(0, 1);
      } else if (keyCode == LEFT) {
        movePlayer(-1, 0);
      } else if (keyCode == RIGHT) {
        movePlayer(1, 0);
      }
    } else if (key == ' ') {
      movePlayer(0, 0);
    }
  }
  */  
}
