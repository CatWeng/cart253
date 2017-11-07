// On mouseclick, a new bouncer is created in the sketch\
// Code taken from here https://forum.processing.org/one/topic/create-new-object-with-mouse-click.html

//Initializes a list of bouncers so more can be created during the sketch
final static ArrayList<Bouncer> bouncers = new ArrayList();

// Code taken from slides
import processing.sound.*;

// Somewhere to store our 5 sound files
SoundFile[] tones = new SoundFile[5];
// The number of frames per beat of music
int framesPerBeat = 15;


// Setup
// Sets screen size to 600x600 and allows mouse click function
void setup() {
  size(600, 600);
  mousePressed();

  // Code taken from slides
  // Go through the array loading sound files into it
  for (int i = 0; i < tones.length; i++) {
    // We can use the i variable to work out which filename to use!
    tones[i] = new SoundFile(this, "tone0" + (i+1) + ".wav");
  }
}

// Draw
// Makes the background pink, draws and runs the bouncers
void draw() {
  background(255);
  for (Bouncer g : bouncers)  g.update();
  // Code taken from slides
  if (frameCount % framesPerBeat == 0) {
    int randomIndex = floor(random(0, tones.length));
    // Play the sound
    tones[randomIndex].play();
  }
}
  // Pick a random index in the array
  // When mouse is pressed a new bouncer is created with
  // a random colour, size, direction, location and movement speed
  void mousePressed() {
    bouncers.add(new Bouncer(random(0, width), random(0, height), random(-10, 10), random(-10, 10), random(20, 50), color(random(255))) );
  }