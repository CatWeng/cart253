//ORBITING PLANETS

// Variables 
float thetaX = 0.0;
float thetaY = 0.0;
float thetaZ = 0.0;
float speed = -0.01;

boolean mousePress;

PShape globe;
PShape moon1;

void setup() {
  // Set screen size to 1000 by 700 and allow for 3D shaped to be drawn
  size(1000, 700, P3D);


  // Create spheres for all the planets, and sets size. 
  globe = createShape(SPHERE, 100); 

  moon1 = createShape(SPHERE, 25); 
  
}

void draw() {
  // Sets background to dark blue and adds a mild static effect to give the impression of stars
  background(#042b6b);
  
  // Creates a planet with a moon that follows its rotation
  // The moon also has its own separate rotation
  translate(width/2, height/2);
  rotateX(thetaX);
  rotateY(thetaY);
  rotateZ(thetaZ);
  shape(globe);
  translate(100, 100, 50);
  shape(moon1);
  moon1.rotateY(0.05);
  
   // Sets the speed of the rotation
  thetaY += speed;
 
  // If the mouse is held down, increase rotation speed in one direction
  // If it is not, this tells the planets to spin in the other direction
  if (mousePress == true) {
    speed = speed+0.0001;
  }
  if (mousePress == false) {
    speed = speed-0.0001;
  }
}

 // Boolean to check for whether the mouse button is held down or not
void mousePressed() {
  mousePress = true;
}
void mouseReleased() {
  mousePress = false;
}

// When the mouse is clicked, sets the rotation to a random angle 
// This changes the viewing angle of the planets 
void mouseClicked() {
  thetaX = random(-1, 1);
  thetaY = random(-1, 1);
  thetaZ = random(-1, 1);
}