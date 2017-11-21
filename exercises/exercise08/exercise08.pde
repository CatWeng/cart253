// VARIABLES
// This varaiable sets the number of Chiyos to be drawn on screen
int numChiyo = 500;
// This variable calls which Chiyos to be drawn by name/number
int numImages = 35;
// Set a grid for even Chiyo distribution
// GridX has to be a multiple of gridWidth for this to work
int gridX = 20;
int gridY = 30;

// Set up independable variable for the Chiyo to be found
int targetX; 
int targetY;
// Makes it so the chiyos are only drawn on a portion of the screen
// Leaves space for an objective bar showing which chiyos to find
int gridWidth = 500;

// Set up arrays for the images to run through and chiyos to draw
PImage[] images = new PImage[numImages];
Chiyo[] chiyos = new Chiyo[numChiyo];

// Trying to set up a clickable target
//Target clickable;
//PImage target;

// SETUP
void setup() {

  // Set box size and background to white
  size(640, 480);
  background(255);
  
  // Trying to set up a clickable target
  //target = loadImage ("findme1.jpg");
  
  targetX = floor(random(0, width/gridX));
  targetY = floor(random(0, height/gridY));
  
  // Trying to set up a clickable target
  //clickable = new Target (650, 400, 50, target);

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
  
  // Trying to set up a clickable target
  //clickable.display();
    
  // Takes the information from setup with grid values and image assignments
  // To repeatedly draw the Chiyos up to the value of NumChiyo (500)
  for (int i = 0; i < chiyos.length; i++) {
    
    // Adds a glitch effect the chiyos (?)
    i = (int) random (numChiyo);
    // Displays the Chiyos
    chiyos[i].display();
  }

}