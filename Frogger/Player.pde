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
  
  void display(float x, float y) {
    image(rocket, x, y);
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
     
    public void moveleft(float x)
    {
      if (xcor > x/2) {
        xcor -= x;
      }
    }
     
    public void moveright()
    {
      if (xcor < width - (tileSize * 1.5)) {
        xcor += tileSize;
      }
    }
    
  boolean collision(Asteroid a) {
  if ((this.xcor < a.xpos+50 && this.xcor > a.xpos-50) && (this.ycor < a.ypos+50 && this.ycor > a.ypos-50)) {
    return true;
    
   }
   else return false;
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
