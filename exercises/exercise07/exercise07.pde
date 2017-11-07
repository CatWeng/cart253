
// So far, the program just creates a round randomly coloured bouncer on a pink background

Bouncer bouncers;

// Creates a bouncer

void setup() {
  size(640, 480);
    bouncers = new Bouncer(random(0, width), random(0, height), random(-10, 10), random(-10, 10), random(20, 50), color(random(255)));
  }


void draw(){
  background(#e987f6);
    
    bouncers.update();
    bouncers.display();
  
}

void mousePressed() {

}
  