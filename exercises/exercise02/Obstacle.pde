//New class to create randomly spawning balls that serve as points. 
//Please disregard the name
class Obstacle {

  int obsSize = 50;
  int obsX;
  int obsY;

  Obstacle (int tempX, int tempY, int tempSize) {
    obsX = tempX;
    obsY = tempY;
    obsSize = tempSize;
  }

  void drawObs() {
    ellipseMode(CENTER);
    ellipse(obsX, obsY, obsSize, obsSize);

//If ball overlaps obstacle, sat that obstacle to 'respawn' somewhere random
    if (ballOverlapsObs()) {
      obsX = (int) random(width-obsSize*2);
      obsY = (int) random(height-obsSize*2);
      score++;
    }
  }

//Detecting if the ball is overlapping the obstacle

  void handleBallHitObs() {    
    if (ballOverlapsObs()) {
      ballY = obsY - obsSize/2 - ballSize/2;
      ballY = obsY + obsSize/2 + ballSize/2;

      if (ballOverlapsObs()) {
        ballX = obsX - obsSize/2 - ballSize/2;
        ballX = obsX + obsSize/2 + ballSize/2;
      }
    }
  }
  boolean ballOverlapsObs() {
    if (ballX - ballSize/2 > obsX - obsSize/2 && ballX + ballSize/2 < obsX + obsSize/2) {
      if (ballY - ballSize/2 < obsY + obsSize/2 && ballY + ballSize/2 > obsY - obsSize/2) {
        return true;
      }
    }
    return false;
  }
}