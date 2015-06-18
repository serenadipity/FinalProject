Player player;
Asteroid asteroid;

void setup() {
  size(500, 500);
  player = new Player(100,100,80,80);
  asteroid = new Asteroid(0,0,80,80);
}

void makeAsteroids(Asteroid a) {
  a.display();
}


void draw() {
  background(47,47,79);
  makeAsteroids(asteroid);
  player.display();
}
