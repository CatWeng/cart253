// Enemy
//
// A class defining the behaviour of a single Enemy
// which can move randomly in the window (within the grid),
// loses energy per move, and gains energy from overlapping
// with another Enemy.

class Enemy {
  // Limits for energy level and gains/losses
  int maxEnergy = 255;
  int moveEnergy = -1;
  int collideEnergy = -10;
  int eatEnergy = 20;

  // Position, size, energy, and fill color
  int x;
  int y;
  int size;
  int energy;
  color fill = color(255, 0, 255);

  // Enemy(tempX, tempY, tempSize)
  //
  // Set up the Enemy with the specified location and size
  // Initialise energy to the maximum
  Enemy(int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    size = tempSize;
    energy = maxEnergy;
  }

  // update()
  //
  // Move the Enemy and update its energy levels
  void update() {

    // QUESTION: What is this if-statement for?

    //This if statements returns if the Enemy energy has reached 0, 'killing' it
    if (energy == 0) {
      return;
    }

    // QUESTION: How does the Enemy movement updating work?

    //'floor' rounds the random value down so the Enemy can only move one block
    //at a time in any adjacent space. the 'size' ensures that the Enemys move around 
    //neatly in an invisible grid and so they can overlap properly. 
    int xMoveType = floor(random(-1, 2));
    int yMoveType = floor(random(-1, 2));
    x += size * xMoveType;
    y += size * yMoveType;

    // QUESTION: What are these if statements doing?

    // If any Enemys go off a side of the screen these if statements
    // tell them to wrap around to the other side so they can keep moving. 
    if (x < 0) {
      x += width;
    } else if (x >= width) {
      x -= width;
    }
    if (y < 0) {
      y += height;
    } else if (y >= height) {
      y -= height;
    }

    // Update the Enemy's energy
    // Note that moveEnergy is negative, so this _loses_ energy
    energy += moveEnergy;

    // Constrain the Enemys energy level to be within the defined bounds
    energy = constrain(energy, 0, maxEnergy);
  }

  // collide(other)
  //
  // Checks for collision with the other Enemy
  // and updates energy level

  void collide(Enemy other) {
    // QUESTION: What is this if-statement for?

    //Checks if either the Enemy or the one it's overlapping
    //has reached an energy level of 0, 'killing' them. Putting it first 
    //gives it priority over gaining energy.
    if (energy == 0 || other.energy == 0) {
      return;
    }

    // QUESTION: What does this if-statement check?

    //This if-statement checks if two Enemys are occupying the same space
    //If they are, this increases their energy levels.
    if (x == other.x && y == other.y) {
      // Increase this Enemy's energy
      energy += collideEnergy;
      // Constrain the energy level to be within bounds
      energy = constrain(energy, 0, maxEnergy);
    }
  }
  
  void eat(Griddie griddie) {
   
    if (energy == 0 || griddie.energy == 0) {
      return;
    }

    if (x == griddie.x && y == griddie.y) {

      energy += eatEnergy;
      griddie.energy -= eatEnergy;

      energy = constrain(energy, 0, maxEnergy);
    }
  }

  // display()
  //
  // Draw the Enemy on the screen as a rectangle
  void display() {
    // QUESTION: What does this fill line do?

    //This changes opacity depending on the Enemy's energy level. 
    //full opacity = full energy
    fill(fill, energy); 
    noStroke();
    ellipse(x, y, size, size);
  }
}