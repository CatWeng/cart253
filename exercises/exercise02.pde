/*This code simulates a sort of Pong game by allowing the 'ball'
to bounce off the paddle and walls and creates a 'static'
effect for a more interesting background. 
The paddle can move left and right using arrow keys. */

color backgroundColor = color(0);

int numStatic = 1000;
int staticSizeMin = 1;
int staticSizeMax = 3;
color staticColor = color(200);

int paddleX;
int paddleY;
int paddleVX;
int paddleSpeed = 10;
int paddleWidth = 128;
int paddleHeight = 16;
color paddleColor = color(255);

int ballX;
int ballY;
int ballVX;
int ballVY;
int ballSpeed = 5;
int ballSize = 16;
color ballColor = color(255);

//Set size and paddle/ball position
void setup() {
  size(640, 480);
  
  setupPaddle();
  setupBall();
}

//Set initial paddle position and movement speed to 0
void setupPaddle() {
  paddleX = width/2;
  paddleY = height - paddleHeight;
  paddleVX = 0;
}

//Set initial ball position and movement direction + speed
void setupBall() {
  ballX = width/2;
  ballY = height/2;
  ballVX = ballSpeed;
  ballVY = ballSpeed;
}
/*The draw loop takes the updating code from the functions
Drawstatic: draws the random static background
Takes the updated/current paddle and ball coordinates
Redraws paddle and ball in the new coordinates
*/
void draw() {
  background(backgroundColor);

  drawStatic();

  updatePaddle();
  updateBall();

  drawPaddle();
  drawBall();
}
//Sets the background to draw up to 1000 different
//tiny squares with a size of 1-3 in random locations to act as static 
void drawStatic() {
  for (int i = 0; i < numStatic; i++) {
   float x = random(0,width);
   float y = random(0,height);
   float staticSize = random(staticSizeMin,staticSizeMax);
   fill(staticColor);
   rect(x,y,staticSize,staticSize);
  }
}
//Constrains the paddle to keep the edges within the frame
//Finds coordinates to update and redraw the paddle
//Determines paddle direction and velocity with keypressed/keyreleased
void updatePaddle() {
  paddleX += paddleVX;  
  paddleX = constrain(paddleX,0+paddleWidth/2,width-paddleWidth/2);
}
//Finds coordinates to update and redraw the ball every frame, checks if any
//conditions have been met for it to change movement and keeps it
//bouncing within the frame.
void updateBall() {
  ballX += ballVX;
  ballY += ballVY;
  
  handleBallHitPaddle();
  handleBallHitWall();
  handleBallOffBottom();
}
//Draws the paddle
void drawPaddle() {
  rectMode(CENTER);
  noStroke();
  fill(paddleColor);
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
}
//Draws the ball
void drawBall() {
  rectMode(CENTER);
  noStroke();
  fill(ballColor);
  rect(ballX, ballY, ballSize, ballSize);
}
//When the ball comes into contact with paddle,
//this tells the ball to go in a reverse direction 
void handleBallHitPaddle() {
  if (ballOverlapsPaddle()) {
    ballY = paddleY - paddleHeight/2 - ballSize/2;
    ballVY = -ballVY;
  }
}
//Function name self explanatory. Checks whether the ball
//is in contact with the paddle or not by detecting edges
boolean ballOverlapsPaddle() {
  if (ballX - ballSize/2 > paddleX - paddleWidth/2 && ballX + ballSize/2 < paddleX + paddleWidth/2) {
    if (ballY > paddleY - paddleHeight/2) {
      return true;
    }
  }
  return false;
}
//Tells ball to go back to starting position if it 'falls' 
//through the bottom/is missed by the paddle
//Direction of the velocity is kept the same on 'reset'
void handleBallOffBottom() {
  if (ballOffBottom()) {
    ballX = width/2;
    ballY = height/2;
  }
}
boolean ballOffBottom() {
  return (ballY - ballSize/2 > height);
}

// If ball hits any of the walls this tells it to 'bounce' back
void handleBallHitWall() {
  if (ballX - ballSize/2 < 0) {
    ballX = 0 + ballSize/2;
    ballVX = -ballVX;
  } else if (ballX + ballSize/2 > width) {
    ballX = width - ballSize/2;
    ballVX = -ballVX;
  }
  
  if (ballY - ballSize/2 < 0) {
    ballY = 0 + ballSize/2;
    ballVY = -ballVY;
  }
}
//Tells paddle to move when the key is pressed
void keyPressed() {
  if (keyCode == LEFT) {
    paddleVX = -paddleSpeed;
  } else if (keyCode == RIGHT) {
    paddleVX = paddleSpeed;
  }
}
//Tells paddle to stop moving if the key is released
void keyReleased() {
  if (keyCode == LEFT && paddleVX < 0) {
    paddleVX = 0;
  } else if (keyCode == RIGHT && paddleVX > 0) {
    paddleVX = 0;
  }
}