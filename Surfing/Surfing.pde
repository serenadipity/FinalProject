
Player player;
PVector velocity;
float gravity;

int xspacing = 1;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave
int time;

float theta = 0.0;  // Start angle at 0
float amplitude = 75.0;  // Height of wave
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

void setup() {
  size(640,360)  ;
  player = new Player(100,0,20);
  velocity = new PVector(1.5,0);
  size(640, 360);
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  time = millis();
}

void draw() {
  background(0);
  calcWave();
  renderWave();
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.02;


  // For every x value, calculate a y value with sine function
  float x = theta;
  float w = 8*PI;
  int phi = 0;
  for (int i = 0; i < yvalues.length; i++) {
    time = millis();
    //yvalues[i] = amplitude*sin(w*time+phi);
    yvalues[i] = amplitude*sin(x);
    if (millis()%70 == 1) {amplitude +=.1;}
    if (millis()%70== 2) {amplitude -=.1;}
    if (amplitude > 75) {amplitude -= 50;}
    x+=dx;
    //http://www.mathworks.com/matlabcentral/answers/161625-sine-wave-changing-amplitude
    
    /*
    if (x % 10 < 1){
      amplitude = (float)Math.random() * 50;
      delay(2);
    }
    
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
   */
  }
}

void renderWave() {
  noStroke();
  fill(0,255,255);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    rect(x*xspacing, height/2+yvalues[x], 15, 25);
  }
}
