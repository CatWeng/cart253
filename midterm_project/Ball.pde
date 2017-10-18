// Ball
//
// A class that defines a ball that can move around in the window, bouncing
// of the top and bottom, and can detect collision with a paddle and bounce off that.
// Appearance has been changed from a plain white box to a blue star.

class Ball {

  /////////////// Properties ///////////////

  // Created an array and two ints that will allow the ball to reset and start off
  // bouncing randomly into one of the 4 corners and sets ball size.

  int SPEED[] = new int[2];
  int speedarray;
  int speedarray2;
  int SIZE = 20;

  // The location of the ball
  int x;
  int y;

  // The velocity of the ball
  int vx;
  int vy;

 // Scoring variables
  int score1 = 0;
  int score2 = 0;

  boolean offLeft = false;
  boolean offRight = false;

// Star image called
  PImage star;

  /////////////// Constructor ///////////////

  // Ball(int _x, int _y)
  //
  // The constructor sets the variable to their starting values
  // x and y are set to the arguments passed through (from the main program)
  // and the velocity starts at SPEED for both x and y 
  // (so the ball starts by moving down and to the right)
  // NOTE that I'm using an underscore in front of the arguments to distinguish
  // them from the class's properties

  // Added a SPEED variable/array to change the ball direction

  Ball(int _x, int _y) {
    x = _x;
    y = _y;
    vx = 7;
    vy = 7;
    SPEED[0]=7;
    SPEED[1]=-7;
  }


  /////////////// Methods ///////////////

  // update() UNCHANGED
  //
  // This is called by the main program once per frame. It makes the ball move
  // and also checks whether it should bounce of the top or bottom of the screen
  // and whether the ball has gone off the screen on either side.

  void update() {
    // First update the location based on the velocity (so the ball moves)
    x += vx;
    y += vy;

    // Check if the ball is going off the top or bottom
    if (y - SIZE/2 < 0 || y + SIZE/2 > height) {
      // If it is, then make it "bounce" by reversing its velocity
      vy = -vy;
    }
  }

  // reset()
  //
  // Resets the ball to the centre of the screen.
  // Uses the speedarray to randomly pick either a negative or positive number.
  // This allows the ball to restart and move towards any of the four corners.
  // This also resets its speed back to the default value.

  void reset() {
    x = width/2;
    y = height/2;
    speedarray = floor(random(0, 2));
    speedarray2 = floor(random(0, 2));
    vx = SPEED[speedarray];
    vy = SPEED[speedarray2];
  }

  // isOffScreen()
  //
  // Returns true if the ball is off the left or right side of the window, otherwise false.
  // When the ball exits the screen it adds one point to the player's score. 

  void score() {
    if (x + SIZE/2 < 0) {
      offLeft = true;
      score1 += 1;
      reset();
    }
    if (x - SIZE/2 > width) {
      offRight = true;
      score2 += 1;
      reset();
    }
  }

  // collide(Paddle paddle) UNCHANGED
  //
  // Checks whether this ball is colliding with the paddle passed as an argument
  // If it is, it makes the ball bounce away from the paddle by reversing its
  // x velocity

  void collide(Paddle paddle) {
    // Calculate possible overlaps with the paddle side by side
    boolean insideLeft = (x + SIZE/2 > paddle.x - paddle.WIDTH/2);
    boolean insideRight = (x - SIZE/2 < paddle.x + paddle.WIDTH/2);
    boolean insideTop = (y + SIZE/2 > paddle.y - paddle.HEIGHT/2);
    boolean insideBottom = (y - SIZE/2 < paddle.y + paddle.HEIGHT/2);

    // Check if the ball overlaps with the paddle
    if (insideLeft && insideRight && insideTop && insideBottom) {
      // If it was moving to the left
      if (vx < 0) {
        // Reset its position to align with the right side of the paddle
        x = paddle.x + paddle.WIDTH/2 + SIZE/2;
      } else if (vx > 0) {
        // Reset its position to align with the left side of the paddle
        x = paddle.x - paddle.WIDTH/2 - SIZE/2;
      }
      // And make it bounce
      // The random integer adds a small variation to the ball's reflection speed
      // and angle so it isn't always a plain 90 degree angle
      vx = -vx + (int) random(-3, 3);
    }
  }

  // display()
  //
  // Draw the ball at its position

  void display() {
    // Set up the appearance of the ball
    // Replaced with a small dark blue star
    
    imageMode(CENTER);
    star = loadImage ("star.png");
    star.resize(SIZE, SIZE);

    // Draw the ball
    image (star, x, y, SIZE, SIZE);
  }
}