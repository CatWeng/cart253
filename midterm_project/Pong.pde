// Pong
//
// A simple version of Pong using object-oriented programming.
// Allows to people to bounce a ball back and forth between
// two paddles that they control.
//
//This version has been changed to 'Claustrophobia Pong'.
//Two claustrophobic players are in boxes that will shrink whenever they lose a point.
//As the boxes shrink, the players become scared and start shivering.
//The smaller the box, the more the player shivers until eventually (at 10 points)
//The box becomes too small to continue and the player who has reached it first loses.

// Global variables for the paddles, the ball, the background boxes and the end screen.
Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;
Box boxLeft;
Box boxRight;
End endscreen;

// The distance from the edge of the window a paddle should be
int PADDLE_INSET = 8;

// The background colour during play (black)
color backgroundColor = color(0);

// Added a background image for the void the players are scared of.
PImage img;

// setup()
// Sets the size and creates the paddles, ball boxes and end screen
// Also sets the background image 

void setup() {

  size(860, 400);
  img = loadImage("void.jpg");
  img.resize(860, 400);
  background (img);

  // Create the paddles on either side of the screen. 
  // Use PADDLE_INSET to position them on x, position them both at centre on y
  // Also pass through the two keys used to control 'up' and 'down' respectively
  // Creates the boxes that will be shrinking with the paddles inside
  // Creates an end game screen determining the winner

  leftPaddle = new Paddle(PADDLE_INSET, height/2, 'w', 's');
  rightPaddle = new Paddle(width - PADDLE_INSET, height/2, 'o', 'l');
  boxLeft = new Box(0, 0, width/2, height, color(220, 200, 255));
  boxRight = new Box(width/2, 0, width/2, height, color(220, 200, 255));
  endscreen = new End();


  // Create the ball at the centre of the screen
  ball = new Ball(width/2, height/2);
}

// draw()
//
// Handles all the magic of making the paddles and ball move, checking
// if the ball has hit a paddle, and displaying everything.

void draw() {
  // Fill the background each frame so we have animation
  background(img);

  // Update the paddles, ball and box by calling their update methods
  leftPaddle.update();
  rightPaddle.update();
  ball.update();
  boxLeft.update();
  boxRight.update();

  // Check if the ball has collided with either paddle
  ball.collide(leftPaddle);
  ball.collide(rightPaddle);

  // Check if the ball has gone off the screen and add points 
  if (ball.x + ball.SIZE/2 <0||ball.x - ball.SIZE/2 >width) {
    ball.score();
  }

  // Display the paddles, ball and boxes
  boxLeft.display();
  boxRight.display();
  leftPaddle.display();
  rightPaddle.display();
  ball.display();

  // Display end screen when necessary
  endscreen.gameover();
}

// keyPressed()
//
// The paddles need to know if they should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the paddles

void keyPressed() {
  // Just call both paddles' own keyPressed methods
  leftPaddle.keyPressed();
  rightPaddle.keyPressed();
}

// keyReleased()
//
// As for keyPressed, except for released!

void keyReleased() {
  // Call both paddles' keyReleased methods
  leftPaddle.keyReleased();
  rightPaddle.keyReleased();
}