int w; //width
int h; //height
Player player;
PVector velocity;

float gravity;


void setup() {
  size(w, h);
  player = new Player(100,0,20);
  velocity = new PVector(1.5,0);
}

void draw() {
  background(0,0,0);
}

