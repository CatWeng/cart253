// This class creates a bouncing ball that will play a  random sound
// Whenever it bounces into one of the walls.

class Bouncer {

  // Varaiables for following the brightest pixel
  float floatX;
  float floatY;
  float easing = 0.05;

  // Variables for position
  float x;
  float y;

  // Variables for velocity
  float vx;
  float vy;

  // The size of the Bouncer
  float size;

  // The current fill colour of the Bouncer
  color fillColor;

  // The default fill colour of the Bouncer
  color defaultColor;

  // Add an image instead of plain balls
  PImage img;

  //Create boolean to detect if mouse is hovering over a bouncer
  boolean hover=false;
  //Int to make sound pause and play
  int currentRate = 1;

  // Bouncer(tempX,tempY,tempVX,tempVY,tempSize,tempDefaultColor)
  //
  // Creates a Bouncer with the provided values by remembering them.

  Bouncer(float tempX, float tempY, float tempVX, float tempVY, float tempSize, color tempDefaultColor) {
    x = tempX;
    y = tempY;
    vx = tempVX;
    vy = tempVY;
    size = tempSize;
    defaultColor = tempDefaultColor;
    fillColor = defaultColor;
  }

  // update()
  //
  // Adds the Bouncer's current velocity to its position 
  // and checks for bouncing off the walls.
  // Draws the bouncer in the same void now.
  void update() {
    x += vx;
    y += vy;

    handleBounce();
    display();
    hover();
  }

  // handleBounce()
  //
  // Checks if the bouncer is overlapping a side of the window
  // and if so reverses its velocity appropriately

  void handleBounce() {
    // Check the left and right
    if (x - size/2 < 0 || x + size/2 > width) {
      // Bounce on the x-axis
      vx = -vx;
      int randomIndex = floor(random(0, tones.length));
      // Play the sound
      tones[randomIndex].play();
    }

    // Check the top and bottom
    if (y - size/2 < 0 || y + size/2 > height) {
      // Bounce on the y-axis
      vy = -vy;
      int randomIndex = floor(random(0, tones.length));
      // Play the sound
      tones[randomIndex].play();
    }

    // Make sure the Bouncer isn't off the edge
    x = constrain(x, size/2, width-size/2);
    y = constrain(y, size/2, height-size/2);
  }

  // display()
  //
  // Draw an ellipse in the Bouncer's location, with its size and colour defined 
  void display() {
    noStroke();
    fill(fillColor);
    ellipse( x, y, size, size);
  }

  // When a bouncer is hovered over, the kick sound file plays 
  void hover() {
    // Detects if mouse is inside area of the bouncer
    if (mouseX <= x+size/2 && mouseX >= x-size/2 && mouseY <= y+size/2 && mouseY >= y-size/2) {
      // If hover is false then set it to true while inside the area so sound plays just once 
      if (!hover) {
        file.play();
        hover = true;
      }
     // If outside area, sets hover to false so sound stops playing 
    } else {
      hover = false;
      file.stop();
    }
  }
}