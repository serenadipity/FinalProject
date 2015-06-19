class Base {
  
  PImage image;
  float xpos, ypos;
  float Height, Width; 
  float tileSize;
  
  Base(String image1, float x, float y, float w, float h) {
    xpos = x;
    ypos = y;
    Height = h;
    Width = w;
    tileSize = w;
    image = loadImage(image1);
    image.resize((int)w,(int)h);
  }
  
    void display(float x, float y) {
    image(image, x, y);
    }
  
}
