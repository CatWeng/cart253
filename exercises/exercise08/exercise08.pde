// VARIABLES
// This varaiable sets the number of Chiyos to be drawn on screen
int numChiyo = 500;
// This variable calls which Chiyos to be drawn by name/number
int numImages = 35;
// Set a grid for even Chiyo distribution
int gridX = 20;
int gridY = 30;
// Makes it so the chiyos are only drawn on a portion of the screen
// Leaves space for an objective bar showing which chiyos to find
int gridWidth = 500;

// Set up arrays for the images to run through and chiyos to draw
PImage[] images = new PImage[numImages];
Chiyo[] chiyos = new Chiyo[numChiyo];

// SETUP
void setup() {

  // Set box size and background to white
  size(640, 480);
  background(255);

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

    // Displays the Chiyos
    chiyos[i].display();
  }
}