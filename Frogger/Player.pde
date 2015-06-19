class Player {
  
  PImage rocket;
  float xcor, ycor; //coordinates
  float Height, Width;
  float tileSize;
  
  //Default constructor
  Player() {
    tileSize = 60;
  }
  
  Player(float x, float y, float w, float h) {
    xcor = x;
    ycor = y;
    Height = h;
    Width = w;
    tileSize = w;
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
 
 
      public void moveup()
    {
     if (ycor > tileSize) {
       ycor -= tileSize;
       }
     }
     
    public void movedown()
    {
      if (ycor < height - (tileSize * 1.5)) {
        ycor += tileSize;
      }
    }
     
    public void moveleft()
    {
      if (xcor > tileSize/2) {
        xcor -= tileSize;
      }
    }
     
    public void moveright()
    {
      if (xcor < width - (tileSize * 1.5)) {
        xcor += tileSize;
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
