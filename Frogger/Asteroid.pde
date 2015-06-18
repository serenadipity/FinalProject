class Asteroid {
  
  PImage asteroid;
  float xpos, ypos;
  float Height, Width; 
  float xspeed;
  
  Asteroid(float x, float y, float w, float h) {
    xpos = x;
    ypos = y;
    Width = w;
    Height = h;
    asteroid = loadImage("asteroid.png");
    asteroid.resize(50,50);
  }
  
  void display() {
    image(asteroid, 0, 0); 
  }
  
  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    } 
  }
  
  
}
