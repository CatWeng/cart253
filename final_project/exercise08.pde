// This sketch is like a 'Where's Waldo' game but with Chiyo's Dads
// Chiyo's are hidden inside the field of other Chiyos
// An objective bar on the right indicates which ones need to be found

// VARIABLES

// Adding sound library and sound files 
import processing.sound.*;

SoundFile hiss;
SoundFile meow;
SoundFile purr;
SoundFile cry;

//Score keeper, limits the number of attempts to find chiyos
int lives=5;
//Second score keeper, when player has found all chiyos it triggers a win
int win=0;
// This variable sets the number of Chiyos to be drawn on screen
int numChiyo = 500;
// This variable calls which Chiyos to be drawn by name/number
int numImages = 35;
// Set a grid for even Chiyo distribution
// GridX has to be a multiple of gridWidth for this to work
int gridX = 20;
int gridY = 30;

// Set up variable for the Chiyo to be found to adjust difficulty levels
// 50 is the normal size but it's set tp 80 for easy visibility
int targetSize = 80; 

// Makes it so the chiyos are only drawn on a portion of the screen
// Leaves space for an objective bar showing which chiyos to find
int gridWidth = 500;

// Set up arrays for the images to run through and chiyos to draw
PImage[] images = new PImage[numImages];
Chiyo[] chiyos = new Chiyo[numChiyo];
// Set up flies
Fly fly; 

// Sets up two chiyos, one on the side to act as an objective
// And one hidden with the rest of the Chiyos to be found
// When the hidden Chiyo is found and clicked, the objective image is replaced
// By a greyscale image
Target catIcon;
Target catTarget;
Target catIcon2;
Target catTarget2;
Target catIcon3;
Target catTarget3;
PImage target;
PImage targetFound;
PImage target2;
PImage targetFound2;
PImage target3;
PImage targetFound3;

// Sets up an end screen so tha player can win or lose the game
End end;
PImage endscreen;

// Variable for background image
PImage BG;

// Variable for the fly images
PImage flyImg;

// SETUP
void setup() {

  // Set box size and background to white
  size(640, 480);
  background(255);
  textSize(20);
  noStroke();

  // Loading and resizing background image
  BG = loadImage ("ChiyoBG.jpg");
  BG.resize(640, 480);

  // Loading in sound files
  meow = new SoundFile(this, "Meow.mp3");
  hiss = new SoundFile(this, "Hiss.mp3");
  purr = new SoundFile(this, "Purr.mp3");
  cry = new SoundFile(this, "Crying.mp3");

  // Setting up all the clickable target Chiyos
  target = loadImage ("findme.png");
  targetFound = loadImage ("found.png");
  target2 = loadImage ("findme2.png");
  targetFound2 = loadImage ("found2.png");
  target3 = loadImage ("findme3.png");
  targetFound3 = loadImage ("found3.png");

  // catIcon sets up the hidden Chiyo while catTarget sets up the indicator on the side
  catIcon = new Target ((int) random(0, gridWidth-targetSize), (int) random(0, height-targetSize), targetSize, target);
  catTarget = new Target (width-110, 50, 100, target);
  catIcon2 = new Target ((int) random(0, gridWidth-targetSize), (int) random(0, height-targetSize), targetSize, target2);
  catTarget2 = new Target (width-110, 150, 100, target2);
  catIcon3 = new Target ((int) random(0, gridWidth-targetSize), (int) random(0, height-targetSize), targetSize, target3);
  catTarget3 = new Target (width-110, 230, 100, target3);

  // Generates a new 'Fly' which is a chiyo that spawns on mouse click and falls 
  // A random image is chosen each time 
  flyImg = loadImage ((int)random(0, numImages)+".png");
  fly = new Fly(-400, -400, 3, 2, flyImg);

  // Sets end screen to cover the whole screen with an image
  end = new End (0, 0, width, height, endscreen);

  // Load all the images by their number/name starting from '0' and up to whatever numImages is
  for (int i = 0; i < images.length; i++) {
    images[i] = loadImage(i + ".png" );
  }
  // Set up variables for Chiyo x,y coordinates and an index number to count them
  int y = 0;
  int x = 0;
  int index = 0;

  // Draw a new Chiyo with 'index' defining the image and x defining the x co-ordinate
  // Keeps looping and drawing chiyos until the length(500) has been reached
  for (int i = 0; i < chiyos.length; i++) {
    chiyos[i] = new Chiyo(x, y, images[index]);
    x+= gridX;

    // Uses modulo to check if the number of chiyos has reached the end 
    // When it does, resets the x position so they start drawing again from the edge
    // Also tells the Y position to go one grid value down so it starts drawing from a new line
    if (i!=0 && (i*gridX) % gridWidth == 0) {
      y = y+gridY;
      x = 0;
    }
    // Tells the index to reset once all the images have been run through
    // So the images keep loading in a loop
    if (index == 34) {
      index = 0;
    }
    index+=1;
  }
}

// DRAW
void draw() {
  // Draws background in
  background(BG);
  // Draws text black
  fill (0);
  // Writes 'Find me:' above the objective Chiyos and keeps track of score
  text("Find me:", width-100, 40);
  text(lives, width-80, height-40);

  // Takes the information from setup with grid values and image assignments
  // To repeatedly draw the Chiyos up to the value of NumChiyo (500)
  for (int i = 0; i < chiyos.length; i++) {

    // Adds a glitch effect the chiyos (?)
    // i = (int) random (numChiyo);
    // Displays the Chiyos
    chiyos[i].display();
  }

  // Display all the target and objective Chiyos
  catIcon.display();
  catTarget.display();
  catIcon2.display();
  catTarget2.display();
  catIcon3.display();
  catTarget3.display();

  // Triggers end when one of the end screen's condition is met
  end.win();
  end.lose();

  // On mouse click triggers a falling Chiyo fly 
  // They all start at the same velocity then speed up as if there's gravity
  fly.mouseClicked();
  fly.update();
}

// mouseClicked triggers the image change for the Chiyo and flyFall function
void mouseClicked() {
  catTarget.mouseClicked();
  flyFall();
}

// This function calls a random image to be assigned to the chiyo on every click
// Also resets it to the mouse's position
void flyFall() {
  flyImg = loadImage ((int)random(0, numImages)+".png");
  fly.x = mouseX;
  fly.y = mouseY;
}