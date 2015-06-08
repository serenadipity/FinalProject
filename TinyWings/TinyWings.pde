/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/28711*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
// simple Tiny Wings-like game using Reflections2 example
// http://itunes.apple.com/ru/app/tiny-wings/id417817520
// http://processing.org/learning/topics/reflection2.html

// press any key to boost gravity 


int wdth = 500; // dimensions of screen
int hght = 500;
int Nsegm = 500; // number of segments for surface rendering

Orb orb; // bird
PVector velocity; // bird velocity

float gravity;
float gravity_normal = 0.05; // usual gravity 
float gravity_boost = 0.25; // gravity boost
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
  size(wdth, hght);  
  smooth();
  
  // initialize bird
  orb = new Orb(100, 0, 10);
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
  background(256, 200 + 0.5*(surf(orb.x)-orb.y), 20 - 0.5*(surf(orb.x)-orb.y));
  
  // Zoom in and out effect:
  // Calculate scale factor which depends on 
  // the distance of the bird from the surface.
  // Here we use Fermi distribution formula to 
  // make scaking relatively smooth
  // http://en.wikipedia.org/wiki/Fermi-Dirac_statistics
  float kT = 150;
  s = 0.1 + 1/(1  + exp( abs(orb.y + orb.r - surf(orb.x))/kT ) );
  
  // initiate scaling
  scale(s);
  
  
  // We are going to put the bird in the
  // center of the screen and move everything
  // around. To avoid numerical problems when
  // calculating sinusoids from large argument
  // we do phase shift instead. 
  if( orb.x>width )
  {
    ph1 = (ph1 + 2*PI * w1)%(2*PI); // phase gain (remainder of 2PI)
    ph2 = (ph2 + 2*PI * w2)%(2*PI);
    ph3 = (ph3 + 2*PI * w3)%(2*PI);
    orb.x = orb.x - width; // reset bird position
    offset = offset + decline*width; // adjust vertical offset of the surface
  }
  // put bird to the center
  translate(width/2/s - orb.x, height/2/s - orb.y); // note scale factor
  
  // if any key is pressed induce gravity boost   
  if(keyPressed)
  {
    gravity = gravity_boost;
  }
  else
  {
    gravity = gravity_normal;
  }
  
  // move orb
  orb.x += velocity.x;
  velocity.y += gravity;
  orb.y += velocity.y;
        
  // draw surface ( with scale factor )
  stroke(123, 123, 0);
  fill(10, 234, 150);  
  float[] x = range(-width/2/s - 50 + orb.x, width/2/s + 50 + orb.x, Nsegm);
  beginShape();
  vertex( -width/2/s - 50 + orb.x, height/2/s + orb.y + 50 );
  for( int j = 0; j<x.length; j++ )
  {
    vertex( x[j],  surf(x[j]) );    
  }
  vertex( width/2/s + 10 + orb.x, height/2/s + orb.y + 10 );
  endShape();
  
  // Draw orb 
  noStroke();
  fill(45, 10, 200);
  if( orb.r >= 1)
  {
    ellipse(orb.x, orb.y, orb.r*2, orb.r*2); //(orb.r is already scaled)
  }
  else // prevent from bird beeing too small
  {
    ellipse(orb.x, orb.y, 2, 2);
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
float[] range(float xs, float xf, int Nsegm_)
{
   float dx = (xf - xs)/Nsegm_;
   float[] x = new float[Nsegm_+1];
   for( int j = 0; j<Nsegm_+1; j++ )
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
  if( orb.y + orb.y > surf( orb.x ) )
  {
    // linear approximation of the surface element
    Ground g = new Ground( orb.x - 1, surf(orb.x-1), orb.x + 1, surf( orb.x + 1) );
    // check for collisions with linear segment
    checkGroundCollision(g);    
  } 
}

// Taken as is from Refections2 example
// http://processing.org/learning/topics/reflection2.html
void checkGroundCollision(Ground groundSegment) {

  // Get difference between orb and ground
  float deltaX = orb.x - groundSegment.x;
  float deltaY = orb.y - groundSegment.y;

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
   collision and also that orb is within 
   left/rights bounds of ground segment */
  if (groundYTemp > -orb.r &&
    orb.x > groundSegment.x1 &&
    orb.x < groundSegment.x2 ){
    // keep orb from going into ground
    groundYTemp = -orb.r;
    // bounce and slow down orb
    velocityYTemp *= -1.0;
    velocityYTemp *= damping;
    
    if(keyPressed && velocity.x>0)
    {
      //velocityXTemp *= 1.01;
    }
  }

  // Reset ground, velocity and orb
  deltaX = cosine * groundXTemp - sine * groundYTemp;
  deltaY = cosine * groundYTemp + sine * groundXTemp;
  velocity.x = cosine * velocityXTemp - sine * velocityYTemp;
  velocity.y = cosine * velocityYTemp + sine * velocityXTemp;
  orb.x = groundSegment.x + deltaX;
  orb.y = groundSegment.y + deltaY;
}



