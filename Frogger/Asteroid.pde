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
    asteroid.resize((int)w,(int)h);
  }
  
  void display() {
    image(asteroid, xpos, ypos); 
  }
  
  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    } 
  }
  
  
}


