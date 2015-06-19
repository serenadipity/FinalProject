class Asteroid {
  
  PImage asteroid;
  float xpos, ypos;
  float Height, Width; 
  float tileSize;
  int asteroidType;
  int moneyContent;
  int fuelContent;
  boolean dead;
  
  
  Asteroid(float x, float y, float w, float h, int imageNum) {
    xpos = x;
    ypos = y;
    Width = w;
    Height = h;
    tileSize = w;
    asteroidType = imageNum;
    
    
    //Fuel asteroid
    if(imageNum == 0)
    {
      asteroid = loadImage("ass1.png");
      moneyContent = 0;
      fuelContent = 50;
    }
    else if(imageNum == 1)
    {
      asteroid = loadImage("ass2.png");
      moneyContent = 0;
      fuelContent = 0;
    }
    //Money asteroid
    else
    {
      asteroid = loadImage("ass3.png");
      moneyContent = 50;
      fuelContent = 0;
    }
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
    
    public void changeToDead()
    {
       asteroid = loadImage("ass2.png");
       asteroid.resize((int)Width,(int)Height);
       dead = true;
    }
}


