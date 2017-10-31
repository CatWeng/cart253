//ORBITING PLANETS

// Variables 
float thetaX = 0.0;
float thetaY = 0.0;
float thetaZ = 0.0;
float speed = -0.01;

boolean mousePress;

PShape globe;
PShape moon1;
PShape moon2;
PShape moon3;
PShape moon4;

// Code taken from exercise 2
// Variables to create a 'static-y' background.
int numStatic = 30;
int staticSizeMin = 1;
int staticSizeMax = 8;
color staticColor = color(200);

void setup() {
  // Set screen size to 1000 by 700 and allow for 3D shaped to be drawn
  size(1000, 700, P3D);


  // Create spheres for all the planets, and sets size. 
  globe = createShape(SPHERE, 100); 
  moon1 = createShape(SPHERE, 25); 
  moon2 = createShape(SPHERE, 50); 
  moon3 = createShape(SPHERE, 70); 
  moon4 = createShape(SPHERE, 100);
}

void draw() {
  // Sets background to dark blue and adds a mild static effect to give the impression of stars
  background(#042b6b);
  drawStatic();

  // Creates a planet with several moons that follows its rotation
  // The moons also have their own unique rotation
  translate(width/2, height/2);
  rotateX(thetaX);
  rotateY(thetaY);
  rotateZ(thetaZ);
  shape(globe);
  translate(100, 100, 50);
  shape(moon1);
  moon1.rotateY(0.05);
  translate(-700, 100, -100);
  rotateZ(thetaZ+0.3);
  shape(moon2);
  moon2.rotateY(0.1);
  translate(600, -800, 700);
  rotateZ(thetaZ-0.2);
  shape(moon3);
  moon3.rotateX(0.1); 
  translate(-2500, 100, -200);
  shape(moon4);
  moon4.rotateZ(0.5);

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

  // Code taken from exercise 2
  // Continuously creates randomly sized small, off-white ellipses, up to a maximum
  // In this case 30 is the maximum, placed randomly anywhere on screen
  void drawStatic() {
    for (int i = 0; i < numStatic; i++) {
      float x = random(0, width);
      float y = random(0, height);
      float staticSize = random(staticSizeMin, staticSizeMax);
      fill(staticColor);
      ellipse(x, y, staticSize, staticSize);
    }
  }