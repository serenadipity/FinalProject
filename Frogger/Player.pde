class Player {
  
  float xcor, ycor; //coordinates
  int tileSize;
  
  //Default constructor
  Player() {
    tileSize = 1;
  }
  
  Player(float x, float y) {
    this.xcor = x;
    this.ycor = y;
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
