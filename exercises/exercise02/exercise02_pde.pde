/*This code simulates a sort of Pong game by allowing the 'ball'
 to bounce off the paddle and walls and creates a 'static'
 effect for a more interesting background. 
 The paddle can move left and right using the arrow and A/D keys. 
 
 EDIT: At each interval of 10 points the background will lighten in colour
 Points are gained by collecting the white balls with the ball
 When points are collected, they disappear and randomly reappear somewhere else
 If the ball 'falls' out either the top or bottom the score will reset to zero
 
 Named 'Obstacle' because originally meant to be obstacles that the ball
 bounced off of but that idea didn't work out as well*/
 
Obstacle obs1;
Obstacle obs2;
Obstacle obs3;
Obstacle obs4;
Obstacle obs5;

color backgroundColor;

int score=0;

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

int paddle2X;
int paddle2Y;
int paddle2VX;

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
  setupPaddle2();
  setupBall();
  
// Create 5 new obstacles that can be hit for points
  obs1 = new Obstacle(50, 200, 50);
  obs2 = new Obstacle(110, 110, 50);
  obs3 = new Obstacle(300, 390, 50);
  obs4 = new Obstacle(480, 30, 50);
  obs5 = new Obstacle(600, 280, 50);

  textSize(20);
}

//Set initial paddle position and movement speed to 0
void setupPaddle() {
  paddleX = width/2;
  paddleY = height - paddleHeight;
  paddleVX = 0;
}

void setupPaddle2() {
  paddle2X = width/2;
  paddle2Y = 0 + paddleHeight;
  paddle2VX = 0;
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
  changeBackground();
  drawStatic();

  updatePaddle();
  updatePaddle2();
  updateBall();

  drawPaddle();
  drawPaddle2();
  drawBall();
  obs1.drawObs();
  obs1.handleBallHitObs();
  obs2.drawObs();
  obs2.handleBallHitObs();
  obs3.drawObs();
  obs3.handleBallHitObs();
  obs4.drawObs();
  obs4.handleBallHitObs();
  obs5.drawObs();
  obs5.handleBallHitObs();
  text(score, 50, 50);

}
//Sets the background to draw up to 1000 different
//tiny squares with a size of 1-3 in random locations to act as static 
void drawStatic() {
  for (int i = 0; i < numStatic; i++) {
    float x = random(0, width);
    float y = random(0, height);
    float staticSize = random(staticSizeMin, staticSizeMax);
    fill(staticColor);
    rect(x, y, staticSize, staticSize);
  }
}
//Constrains the paddle to keep the edges within the frame
//Finds coordinates to update and redraw the paddle
//Determines paddle direction and velocity with keypressed/keyreleased
void updatePaddle() {
  paddleX += paddleVX;  
  paddleX = constrain(paddleX, 0+paddleWidth/2, width-paddleWidth/2);
}

void updatePaddle2() {
  paddle2X += paddle2VX;  
  paddle2X = constrain(paddle2X, 0+paddleWidth/2, width-paddleWidth/2);
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

void drawPaddle2() {
  rectMode(CENTER);
  noStroke();
  fill(paddleColor);
  rect(paddle2X, paddle2Y, paddleWidth, paddleHeight);
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

  if (ballOverlapsPaddle2()) {
    ballY = paddle2Y + paddleHeight/2 + ballSize/2;
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

boolean ballOverlapsPaddle2() {
  if (ballX - ballSize/2 > paddle2X - paddleWidth/2 && ballX + ballSize/2 < paddle2X + paddleWidth/2) {
    if (ballY < paddle2Y + paddleHeight/2) {
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
    score=0;
  }
  if (ballOffTop()) {
    ballX = width/2;
    ballY = height/2;
    score=0;
  }
}
boolean ballOffBottom() {
  return (ballY - ballSize/2 > height);
}
boolean ballOffTop() {
  return (ballY - ballSize/2 < 0);
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
}
//Tells paddle to move when the key is pressed
void keyPressed() {
  if (keyCode == LEFT) {
    paddleVX = -paddleSpeed;
  } else if (keyCode == RIGHT) {
    paddleVX = paddleSpeed;
  }

  if (keyCode == 'A') {
    paddle2VX = -paddleSpeed;
  } else if (keyCode == 'D') {
    paddle2VX = paddleSpeed;
  }
}
//Tells paddle to stop moving if the key is released
void keyReleased() {
  if (keyCode == LEFT && paddleVX < 0) {
    paddleVX = 0;
  } else if (keyCode == RIGHT && paddleVX > 0) {
    paddleVX = 0;
  }

  if (keyCode == 'A' && paddle2VX < 0) {
    paddle2VX = 0;
  } else if (keyCode == 'D' && paddle2VX > 0) {
    paddle2VX = 0;
  }
}

//Changes the background depending on the score, gets lighter the higher the score
void changeBackground(){
  
 if(score >= 10) {
   backgroundColor=50;
    if(score >= 20) {
   backgroundColor=100;
    if(score >= 30) {
   backgroundColor=155;
    if(score >= 40) {
   backgroundColor=200;
    if(score >= 50) {
   backgroundColor=255;
 }
 }
 }
 }
 }
 else {
   backgroundColor=0;
 }
}