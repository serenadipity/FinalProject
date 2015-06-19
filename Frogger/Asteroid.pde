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




  /*
    public boolean test_collision(int frog_x)
  {
    int n = 0;
    // for each vehicle in the lane, test if we've hit
    for (int i = -208 + x - lily_length; i < 208 + lily_length*2; i += lily_spacing, n++) {
      if (frog_x - 8 < i + lily_length/2 && frog_x + 8 > i - lily_length/2) { return true; }
    }
    return false; // yay
  }
}
 
// given a frog location, test for collision in the appropriate lane
boolean test_lily_collision(int x)
{
  if (pads.test_collision(x)) { return true; }
  return false;
}
*/
  
  
}


