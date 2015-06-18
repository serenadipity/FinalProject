Player player;
Asteroid asteroid;

void setup() {
  size(500, 500);
  player = new Player();
  asteroid = new Asteroid(0,0,25,25);
}



void makeAsteroids(Asteroid a) {
  asteroid.display();
}

void draw() {
  background(47,47,79);
  makeAsteroids(asteroid);
}
