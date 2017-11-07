// On mouseclick, a new bouncer is created in the sketch\
// Code taken from here https://forum.processing.org/one/topic/create-new-object-with-mouse-click.html

//Initializes a list of bouncers so more can be created during the sketch
final static ArrayList<Bouncer> bouncers = new ArrayList();

// Setup
// Sets screen size to 600x600 and allows mouse click function
void setup() {
  size(600, 600);
  mousePressed();
}

// Draw
// Makes the background pink, draws and runs the bouncers
void draw() {
  background(#ef86ab);
  for (Bouncer b: bouncers)  b.update();
}

// When mouse is pressed a new bouncer is created with
// a random colour, size, direction, location and movement speed
void mousePressed() {
  bouncers.add(new Bouncer(random(0, width), random(0, height), random(-10, 10), random(-10, 10), random(20, 50), color(random(255))) );
}
  