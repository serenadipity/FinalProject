

int WIDTH = 500; // dimensions of screen
int HEIGHT = 500;
int SEGMENTS = 500; // number of segments for surface rendering

Player player; // bird
PVector velocity; // bird velocity

float gravity;
float gravity_normal = 0.07; // usual gravity 
float gravity_boost = 0.75; // gravity boost
float damping = 0.03; // damping

float a1, w1, ph1; //sinusoids
float a2, w2, ph2;
float a3, w3, ph3;
float decline; // decline of the surface
float offset; // vertical offset
float s; // scale factor
  
void setup()
{
  // set screen dimensions
  size(WIDTH, HEIGHT);  
  smooth();
  
  // initialize bird
  player = new Player(100, 0, 20);
  velocity = new PVector(1.5, 0);
  
  // set sinusoids
  a1 = 570;
  a2 = 75;
  a3 = 55;
  w1 = 0.03;
  w2 = 0.57;
  w3 = 0.4;
  ph1 = 0;
  ph2 = random(2*PI);
  ph3 = random(2*PI);
  offset = 3.0/4 * height; // initial vertical offset
  decline = 0.3; // decline 
}

void draw()
{
  // draw background
  background(0, 0, 0);
  
  // Zoom in and out effect:
  // Calculate scale factor which depends on 
  // the distance of the bird from the surface.
  // Here we use Fermi distribution formula to 
  // make scaking relatively smooth
  // http://en.wikipedia.org/wiki/Fermi-Dirac_statistics
  float kT = 150;
  s = 0.1 + 1/(1  + exp( abs(player.y + player.r - surf(player.x))/kT ) );
  
  // initiate scaling
  scale(s);
  
  
  // We are going to put the bird in the
  // center of the screen and move everything
  // around. To avoid numerical problems when
  // calculating sinusoids from large argument
  // we do phase shift instead. 
  if( player.x>width )
  {
    ph1 = (ph1 + 2*PI * w1)%(2*PI); // phase gain (remainder of 2PI)
    ph2 = (ph2 + 2*PI * w2)%(2*PI);
    ph3 = (ph3 + 2*PI * w3)%(2*PI);
    player.x = player.x - width; // reset bird position
    offset = offset + decline*width; // adjust vertical offset of the surface
  }
  // put bird to the center
  translate(width/2/s - player.x, height/2/s - player.y); // note scale factor
  
  // if any key is pressed induce gravity boost   
  if(keyPressed)
  {
    gravity = gravity_boost;
  }
  else
  {
    gravity = gravity_normal;
  }
  
  // move player
  player.x += velocity.x;
  velocity.y += gravity;
  player.y += velocity.y;
        
  // draw surface ( with scale factor )
  stroke(123, 123, 0);
  fill(233, 233, 233);
  float[] x = range(-width/2/s - 50 + player.x, width/2/s + 50 + player.x, SEGMENTS);
  beginShape();
  vertex( -width/2/s - 50 + player.x, height/2/s + player.y + 50 );
  for( int j = 0; j<x.length; j++ )
  {
    vertex( x[j],  surf(x[j]) );    
  }
  vertex( width/2/s + 10 + player.x, height/2/s + player.y + 10 );
  endShape();
  
  // Draw player 
  noStroke();
  fill(51, 255, 51);
  if( player.r >= 1)
  {
    ellipse(player.x, player.y, player.r*2, player.r*2); //(player.r is already scaled)
  }
  else // prevent from bird beeing too small
  {
    ellipse(player.x, player.y, 2, 2);
  }
   
  // Check collision
  checkSurfCollision();
  
}

// Surface is a sum of 3 (or more if you want) 
// sinusoids and a linear term
float surf(float x)
{
    
  float y = offset + a1*sin( 2.*PI * (w1 * x/width) + ph1 ) 
                   + a2*sin( 2.*PI * (w2 * x/width) + ph2 ) 
                   + a3*sin( 2.*PI * (w3 * x/width) + ph3 ) 
                   + decline*x;
    
  return y;                       
}

// Evenly spaced points 
float[] range(float xs, float xf, int SEGMENTS_)
{
   float dx = (xf - xs)/SEGMENTS_;
   float[] x = new float[SEGMENTS_+1];
   for( int j = 0; j<SEGMENTS_+1; j++ )
   {
     x[j] = xs + j*dx; 
   }   
   return x;
}

// Wrapper for checkGroundCollision
// from Ira Greenbergs example 
// http://processing.org/learning/topics/reflection2.html
void checkSurfCollision()
{
  if( player.y + player.y > surf( player.x ) )
  {
    // linear approximation of the surface element
    Ground g = new Ground( player.x - 1, surf(player.x-1), player.x + 1, surf( player.x + 1) );
    // check for collisions with linear segment
    checkGroundCollision(g);    
  } 
}

// Taken as is from Refections2 example
// http://processing.org/learning/topics/reflection2.html
void checkGroundCollision(Ground groundSegment) {

  // Get difference between player and ground
  float deltaX = player.x - groundSegment.x;
  float deltaY = player.y - groundSegment.y;

  // Precalculate trig values
  float cosine = cos(groundSegment.rot);
  float sine = sin(groundSegment.rot);

  /* Rotate ground and velocity to allow 
   orthogonal collision calculations */
  float groundXTemp = cosine * deltaX + sine * deltaY;
  float groundYTemp = cosine * deltaY - sine * deltaX;
  float velocityXTemp = cosine * velocity.x + sine * velocity.y;
  float velocityYTemp = cosine * velocity.y - sine * velocity.x;

  /* Ground collision - check for surface 
   collision and also that player is within 
   left/rights bounds of ground segment */
  if (groundYTemp > -player.r &&
    player.x > groundSegment.x1 &&
    player.x < groundSegment.x2 ){
    // keep player from going into ground
    groundYTemp = -player.r;
    // bounce and slow down player
    velocityYTemp *= -1.0;
    velocityYTemp *= damping;
    
    if(keyPressed && velocity.x>0)
    {
      //velocityXTemp *= 1.01;
    }
  }

  // Reset ground, velocity and player
  deltaX = cosine * groundXTemp - sine * groundYTemp;
  deltaY = cosine * groundYTemp + sine * groundXTemp;
  velocity.x = cosine * velocityXTemp - sine * velocityYTemp;
  velocity.y = cosine * velocityYTemp + sine * velocityXTemp;
  player.x = groundSegment.x + deltaX;
  player.y = groundSegment.y + deltaY;
}



