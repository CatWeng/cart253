// This sketch is like a 'Where's Waldo' game but with Chiyo's Dads
// Chiyo's are hidden inside the field of other Chiyos
// An objective bar on the right indicates which ones need to be found
// 

// VARIABLES
// This varaiable sets the number of Chiyos to be drawn on screen
int numChiyo = 500;
// This variable calls which Chiyos to be drawn by name/number
int numImages = 35;
// Set a grid for even Chiyo distribution
// GridX has to be a multiple of gridWidth for this to work
int gridX = 20;
int gridY = 30;

// Set up variable for the Chiyo to be found to adjust difficulty levels
int targetSize = 50; 

// Makes it so the chiyos are only drawn on a portion of the screen
// Leaves space for an objective bar showing which chiyos to find
int gridWidth = 500;

// Set up arrays for the images to run through and chiyos to draw
PImage[] images = new PImage[numImages];
Chiyo[] chiyos = new Chiyo[numChiyo];

// Sets up two chiyos, one on the side to act as an objective
// And one hidden with the rest of the Chiyos to be found
// When the hidden Chiyo is found and clicked, the objective image is replaced
// By a greyscale image
Target catIcon;
Target catTarget;
PImage target;
PImage targetFound;

// SETUP
void setup() {

  // Set box size and background to white
  size(640, 480);
  background(255);

  // Trying to set up a clickable target
  target = loadImage ("findme.png");
  targetFound = loadImage ("found.png");

  // catIcon sets up the hidden Chiyo while catTarget sets up the 
  catIcon = new Target ((int) random(0, gridWidth-targetSize), (int) random(0, height-targetSize), targetSize, target);
  catTarget = new Target (width-110, 50, 100, target);

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

  // Takes the information from setup with grid values and image assignments
  // To repeatedly draw the Chiyos up to the value of NumChiyo (500)
  for (int i = 0; i < chiyos.length; i++) {

    // Adds a glitch effect the chiyos (?)
    // i = (int) random (numChiyo);
    // Displays the Chiyos
    chiyos[i].display();

    // Set up a clickable target Chiyo
    catIcon.display();
    catTarget.display();
    
    // When the Chiyo is found, clicking it overlaps the image on the right with a black/white one. 
    catTarget.found();
  }
}