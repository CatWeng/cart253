// Griddie
//
// A class defining the behaviour of a single Griddie
// which can move randomly in the window (within the grid),
// loses energy per move, and gains energy from overlapping
// with another Griddie.

class Griddie {
  // Limits for energy level and gains/losses
  int maxEnergy = 255;
  int moveEnergy = -1;
  int collideEnergy = 10;
  
  // Position, size, energy, and fill color
  int x;
  int y;
  int size;
  int energy;
  color fill = color(255,0,0);

  // Griddie(tempX, tempY, tempSize)
  //
  // Set up the Griddie with the specified location and size
  // Initialise energy to the maximum
  Griddie(int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    size = tempSize;
    energy = maxEnergy;
  }

  // update()
  //
  // Move the Griddie and update its energy levels
  void update() {
    
    // QUESTION: What is this if-statement for?
    
    //This if statements returns if the Griddie energy has reached 0, 'killing' it
    if (energy == 0) {
      return;
    }
    
    // QUESTION: How does the Griddie movement updating work?
    
    //'floor' rounds the random value down so the griddie can only move one block
    //at a time in any adjacent space. the 'size' ensures that the griddies move around 
    //neatly in an invisible grid and so they can overlap properly. 
    int xMoveType = floor(random(-1,2));
    int yMoveType = floor(random(-1,2));
    x += size * xMoveType;
    y += size * yMoveType;
    
    // QUESTION: What are these if statements doing?
  
    // If any Griddies go off a side of the screen these if statements
    // tell them to wrap around to the other side so they can keep moving. 
    if (x < 0) {
      x += width;
    }
    else if (x >= width) {
      x -= width;
    }
    if (y < 0) {
      y += height;
    }
    else if (y >= height) {
      y -= height;
    }

    // Update the Griddie's energy
    // Note that moveEnergy is negative, so this _loses_ energy
    energy += moveEnergy;
    
    // Constrain the Griddies energy level to be within the defined bounds
    energy = constrain(energy,0,maxEnergy);
  }

  // collide(other)
  //
  // Checks for collision with the other Griddie
  // and updates energy level
  
  void collide(Griddie other) {
    // QUESTION: What is this if-statement for?
    
    //Checks if either the griddie or the one it's overlapping
    //has reached an energy level of 0, 'killing' them. Putting it first 
    //gives it priority over gaining energy.
    if (energy == 0 || other.energy == 0) {
      return;
    }
    
    // QUESTION: What does this if-statement check?
    
    //This if-statement checks if two griddies are occupying the same space
    //If they are, this increases their energy levels.
    if (x == other.x && y == other.y) {
      // Increase this Griddie's energy
      energy += collideEnergy;
      // Constrain the energy level to be within bounds
      energy = constrain(energy,0,maxEnergy);
    }
    
    if (x == other.x && y == other.y) {
      // Increase this Griddie's energy
      energy += collideEnergy;
      // Constrain the energy level to be within bounds
      energy = constrain(energy,0,maxEnergy);
    }
    
  }

  // display()
  //
  // Draw the Griddie on the screen as a rectangle
  void display() {
    // QUESTION: What does this fill line do?
    
    //This changes opacity depending on the griddie's energy level. 
    //full opacity = full energy
    fill(fill, energy); 
    noStroke();
    rect(x, y, size, size);
  }
}