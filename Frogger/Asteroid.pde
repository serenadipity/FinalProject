class Asteroid {
  
  PImage asteroid;
  float xpos, ypos;
  float Height, Width; 
  float tileSize;
  
  Asteroid(float x, float y, float w, float h) {
    xpos = x;
    ypos = y;
    Width = w;
    Height = h;
    tileSize = w;
    asteroid = loadImage("asteroid.png");
    asteroid.resize((int)w,(int)h);
  }
  
  void display(float x, float y) {
    image(asteroid, x, y); 
  }
  
  
 
 
      public void moveup()
    {
     if (ypos > 0) {
       ypos -= tileSize;
       }
     }
     
    public void movedown()
    {
      if (ypos < height - (tileSize * 1.5)) {
        ypos += tileSize;
      }
    }
     
    public void moveleft()
    {
      if (xpos > 0) {
        xpos -= tileSize;
      }
    }
     
    public void moveright()
    {
      if (xpos < width - (tileSize * 1.5)) {
        xpos += tileSize;
      }
    }
    
}


