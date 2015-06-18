class Player {
  
  PImage rocket;
  float xcor, ycor; //coordinates
  float Height, Width;
  int tileSize;
  
  //Default constructor
  Player() {
    tileSize = 1;
  }
  
  Player(float x, float y, float w, float h) {
    xcor = x;
    ycor = y;
    Height = h;
    Width = w;
    rocket = loadImage("rocket.png");
  }
  
  void display() {
    image(rocket, xcor, ycor);
  }
  
  void movePlayer(int dx, int dy) {
      xcor += dx * tileSize;
      ycor += dy * tileSize;
  }
  
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
      
}
