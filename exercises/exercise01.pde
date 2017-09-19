//This code creates a red ball on a pink background which 'bounces' off the walls.
//The background and ball outline are pink .
//As the ball travels it leaves a red trail.
//Whenever the mouse comes into contact with the ball it changes to blue.
//Whenever the mouse is clicked, the screen is cleared.

//'final' makes it so these values cannot be changed within the program.

final int CIRCLE_SPEED = 7;
//Ball movement speed variable
final color NO_CLICK_FILL_COLOR = color(250, 100, 100);
//Default ball colour
final color CLICK_FILL_COLOR = color(100, 100, 250);
//Ball colour on mouse-over
final color BACKGROUND_COLOR = color(250, 150, 150);
//Pink BG colour
final color STROKE_COLOR = color(250, 150, 150);
//Circle outline color, same as BG
final int CIRCLE_SIZE = 50;
//Ball size variable

int circleX;
//Integer for ball X position
int circleY;
//Integer for ball Y position
int circleVX;
//Integer for ball X velocity
int circleVY;
//Integer for ball Y velocity

void setup() {
  size(640, 480);
  circleX = width/2;
  circleY = height/2;
  //These two values make it so the ball always starts off in the middle
  circleVX = CIRCLE_SPEED;
  circleVY = CIRCLE_SPEED;
  stroke(STROKE_COLOR);
  //Set ball outline
  fill(NO_CLICK_FILL_COLOR);
  //Set ball default colour
  background(BACKGROUND_COLOR);
  //Set background colour
}

void draw() {
    if (dist(mouseX, mouseY, circleX, circleY) < CIRCLE_SIZE/2) {
    fill(CLICK_FILL_COLOR);
  //If mouse is within the designated space the the ball turns blue.
  //Designated space is the ball's center position(circleX, circleY)
  //Circle_size/2 gives the ball's radius, the area that forms the visible ball.
  //So if mouse is within 25px of the ball's position it will turn blue.
  }
  else {
    fill(NO_CLICK_FILL_COLOR);
  //If mouse is not detected within the ball's radius it stays the default colour, red.
  }
  ellipse(circleX, circleY, CIRCLE_SIZE, CIRCLE_SIZE);
  //Draws the ball traveling across the sketch, size set to 50
  circleX += circleVX;
  circleY += circleVY;
  if (circleX + CIRCLE_SIZE/2 > width || circleX - CIRCLE_SIZE/2 < 0) {
    circleVX = -circleVX;
  }
  //If the radius of the ball + the X position exceeds the screen width
  //this tells the ball to invert it's X axis path and go backwards.
  //This makes sure it appears like the edge of the ball 'bounces' off the walls.
  
  if (circleY + CIRCLE_SIZE/2 > height || circleY - CIRCLE_SIZE/2 < 0) {
    circleVY = -circleVY;
  }
  //Same as above, just with the Y axis.
  //Calculate ball size and position to make sure it 'bounces' without being cut off.
}

void mousePressed() {
  background(BACKGROUND_COLOR);
//On click 'clear' the sketch to background colour
}