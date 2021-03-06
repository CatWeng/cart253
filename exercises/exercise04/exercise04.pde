
// Griddies
// by Pippin Barr
// MODIFIED BY: 
//
// A simple artificial life system on a grid. The "griddies" are squares that move
// around randomly, using energy to do so. They gain energy by overlapping with
// other griddies. If a griddie loses all its energy it dies.

// The size of a single grid element
int gridSize = 20;
// An array storing all the griddies
Griddie[] griddies = new Griddie[100];
Enemy[] enemies = new Enemy[20];

// setup()
//
// Set up the window and the griddies

void setup() {
  // Set up the window size and framerate (lower so we can watch easier)
  size(640, 480);
  frameRate(10);

  // QUESTION: What does this for loop do?

  //Spawns new griddies anywhere inside the grid so they don't exceed screen size.
  //Keeps spawning them until they reach the 'length' value, 100.
  for (int i = 0; i < griddies.length; i++) {
    int x = floor(random(0, width/gridSize));
    int y = floor(random(0, height/gridSize));
    griddies[i] = new Griddie(x * gridSize, y * gridSize, gridSize);
  }

  for (int i = 0; i < enemies.length; i++) {
    int x = floor(random(0, width/gridSize));
    int y = floor(random(0, height/gridSize));
    enemies[i] = new Enemy(x * gridSize, y * gridSize, gridSize);
  }
}

// draw()
//
// Update all the griddies, check for collisions between them, display them.

void draw() {
  background(50);

  // We need to loop through all the griddies one by one
  for (int i = 0; i < griddies.length; i++) {

    // Update the griddies
    griddies[i].update();

    // Now go through all the griddies a second time...
    for (int j = 0; j < griddies.length; j++) {
      // QUESTION: What is this if-statement for?

      //This if-statement checks on the second run through to see if any of the griddies
      //have overlapped with each other. 
      if (j != i) {
        // QUESTION: What does this line check?

        //In the case that the griddies have overlapped, this adjusts their energy levels accordingly.
        griddies[i].collide(griddies[j]);
      }
    }

    // Display the griddies
    griddies[i].display();
  }
  
  for (int i = 0; i < enemies.length; i++) {

    // Update the enemies
    enemies[i].update();

    // Now go through all the enemies a second time...
    for (int j = 0; j < enemies.length; j++) {

      if (j != i) {
        enemies[i].collide(enemies[j]);
        enemies[i].eat(griddies[j]);
      }
    }

    // Display the griddies
    enemies[i].display();
  }
}