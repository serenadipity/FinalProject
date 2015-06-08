int WIDTH;
int HEIGHT;
Player player; // Astronaut
PVector velocity; // Velocity of player
float gravity;
float gravity_normal = 0.05;
float gravity_boost = 0.25;
float damping = 0.03;


void setup() {
  size(WIDTH, HEIGHT);
  smooth();
  player = new Player(100, 0, 10);
  velocity = new PVector(1.5, 0);
  a1 = 570;
  a2 = 75;
  
  
}

void draw() {
  background(256, 200 + 0.5 * (surf(player.x) - player
}
