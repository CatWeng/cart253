//ORBITING PLANETS
// This program creates a planet with 3 moons orbiting around it
// As the sketch runs, the rotation increases in speed
// Holding down the mouse causes the rotation to slow down and eventually spin the other way

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

PImage planet;
PImage moonA;
PImage moonB;
PImage moonC;
PImage moonD;

// Code taken from exercise 2
// Variables to create a 'static-y' background.
int numStatic = 30;
int staticSizeMin = 1;
int staticSizeMax = 8;
color staticColor = color(200);

// Setup
void setup() {
  // Set screen size to 1000 by 700 and allow for 3D shaped to be drawn
  size(1000, 700, P3D);

  // Loading images for all the shapes
  planet = loadImage ("planet.png");
  moonA = loadImage ("moon.jpg");
  moonB = loadImage ("moon2.jpg");
  moonC = loadImage ("moon3.png");
  moonD = loadImage ("moon4.jpg");
  
  // Create spheres for all the planets, set sizes and images. 
  // setStroke (false) removes the edge lines from the shapes.
  globe = createShape(SPHERE, 100); 
  globe.setStroke(false);
  globe.setTexture(planet);
  moon1 = createShape(SPHERE, 25); 
  moon1.setStroke(false);
  moon1.setTexture(moonA);
  moon2 = createShape(SPHERE, 50); 
  moon2.setStroke(false);
  moon2.setTexture(moonB);
  moon3 = createShape(SPHERE, 70); 
  moon3.setStroke(false);
  moon3.setTexture(moonC);
  moon4 = createShape(SPHERE, 100); 
  moon4.setStroke(false);
  moon4.setTexture(moonD);
}

void draw() {
  // Sets background to dark blue and adds a mild static effect to give the impression of stars
  background(#042b6b);
  drawStatic();

  // Creates and sets the main planet to the center of the screen in a neutral position
  translate(width/2, height/2);
  rotateX(thetaX);
  rotateY(thetaY);
  rotateZ(thetaZ);
  shape(globe);

  // Creates moons that follow the rotation of the main planet
  // They also have their own unique rotations 
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

  // Sets the initial speed of the rotation
  thetaY += speed;

  if (mousePress == true) {
    /*globe.setTexture(altplanet);
     moon1.setTexture(altmoonA);
     moon2.setTexture(altmoonB);
     moon3.setTexture(altmoonC);*/
    speed = speed+0.0001;
  }
  if (mousePress == false) {
    /* globe.setTexture(planet);
     moon1.setTexture(moonA);
     moon2.setTexture(moonB);
     moon3.setTexture(moonC);*/
    speed = speed-0.0001;
  }
}

// When the mouse is clicked, sets the rotation to a random angle 
// This changes the viewing angle of the planets 
void mouseClicked() {
  thetaX = random(-1, 1);
  thetaY = random(-1, 1);
  thetaZ = random(-1, 1);
}

// Boolean to check for whether the mouse button is held down or not
void mousePressed() {
  mousePress = true;
}
void mouseReleased() {
  mousePress = false;
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