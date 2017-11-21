// VARIABLES

// This variable calls which Chiyos to be drawn by name/number
int numImages = 35;
// Set a grid for even Chiyo distribution
int gridX = 20;
int gridY = 30;

// Set up arrays for the images to run through and chiyos to draw
PImage[] images = new PImage[numImages];
Chiyo[] chiyos = new Chiyo[numImages];

void setup() {

  // Set box size and background to white
  size(640, 480);
  background(255);

  // Load all the images by their number/name starting from '0' and up to whatever numImages is
  for (int i = 0; i < images.length; i++) {
    images[i] = loadImage(i + ".png" );
  }
  
    for (int i = 0; i < chiyos.length; i++) {
     int x = floor(random(0, width/gridX));
    int y = floor(random(0, height/gridY));
    chiyos[i] = new Chiyo(x*gridX, y*gridY, images[i]);
    x+= gridX;
}
}

void draw() {
  // Takes the information from setup with grid values and image assignments
  // To draw all the Chiyos
  for (int i = 0; i < chiyos.length; i++) {
    
    // Displays the Chiyos
    chiyos[i].display();
  }
}