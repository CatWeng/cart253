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
  void update() {
    x += vx;
    y += vy;

    handleBounce();
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
    }

    // Check the top and bottom
    if (y - size/2 < 0 || y + size/2 > height) {
      // Bounce on the y-axis
      vy = -vy;
    }

    // Make sure the Bouncer isn't off the edge
    x = constrain(x, size/2, width-size/2);
    y = constrain(y, size/2, height-size/2);
  }

  // display()
  //
  // Draw an ellipse in the Bouncer's location, with its size
  // and with its fill
  void display() {
    noStroke();
    fill(fillColor);
    //follow();
    // ellipse(x, y, size, size);
    
    // Draws an image of a hummingbird silhouette instead of the ellipses
    //img = loadImage("bird.png");
    ellipse( x, y, size, size);
  }

  // Code taken from the Processing 'Easing' example
  // When the bouncers comes close to the brightest pixel in the image, they will hover around it
  // If the brightest pixel moves around and the bouncer is out of the follow range
  // It will go back to bouncing normally 
  //void follow() {
  //  if (x <= (mouseX-5) || x <= (mouseX+5) && y <= (mouseY-5) || (y <= mouseY+5) ) {
  //    float targetX = mouseX;
  //    float dx = targetX - x;
  //    x += dx * easing;

  //    float targetY = mouseY;
  //    float dy = targetY - y;
  //    y += dy * easing;
  //  }
  //}

}