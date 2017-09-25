//CHANGED Removed all the 'final's so the values can be changed
int G_Val;
int B_Val;
//CHANGED Added two values here to change the green and blue values of the ball

int CIRCLE_SPEED = 7;
//Ball movement speed variable
//color NO_CLICK_FILL_COLOR = color(0, G_Val, B_Val);
//Default ball colour
//CHANGED because colour will not work with a variable within a variable
 color CLICK_FILL_COLOR = color(255, 255, 255);
//Ball colour on mouse-over
color BACKGROUND_COLOR = color(250, 150, 150);
//Pink BG colour
color STROKE_COLOR = color(250, 150, 150);
//Circle outline color, same as BG
int CIRCLE_SIZE = 50;
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
  size(765, 510);
  //CHANGED size to multiples of 255 for easier colour changing
  circleX = width/2;
  circleY = height/2;
  //These two values make it so the ball always starts off in the middle
  circleVX = CIRCLE_SPEED;
  circleVY = CIRCLE_SPEED;
  noStroke();
  //stroke(STROKE_COLOR);
  //Set ball outline
  //CHANGED Removed stroke for a nicer visual effect
  fill(0, G_Val, B_Val);
  //Set ball default colour
  background(#FFFFFF);
  //Set background colour
}

void draw() {
    G_Val = mouseX/3;
    B_Val = mouseY/2;
 //Makes sure the value is from 0-255 so it can change the ball's colour properly
    CIRCLE_SIZE = ((circleX + circleY)/8)+5;
 //Changes the circle's size relative to its position. 
 //Divided by 8 and +5 To prevent it from getting too big or small
    if (dist(mouseX, mouseY, circleX, circleY) < CIRCLE_SIZE/2) {
    fill(CLICK_FILL_COLOR);
  //If mouse is within the designated space the the ball turns white.
  //Designated space is the ball's center position(circleX, circleY)
  //Circle_size/2 gives the ball's radius, the area that forms the visible ball.
  //So if mouse is within 25px of the ball's position it will turn blue.
  }
  else {
    fill(0, G_Val, B_Val);
  //If mouse is not detected within the ball's radius it stays the default colour.
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
    background(random(255),random(255),random(255));
//On click 'clear' the sketch to background colour
//CHANGED so background colour is totally random
}