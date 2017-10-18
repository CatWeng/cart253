// Creates a 'Game over' screen that stop movements and determines a winner.
// The player who reaches 10 points first will be deemed 'too scared to continue'.

class End {

  void gameover() {

    fill(130);
    textSize(30);
    textAlign(CENTER);

    //Draws over the screen with black and writes the game over text on top. 
    if ( ball.score1 == 10 ) {

      background (0, 0, 0);
      text ("Player 1 was too scared to continue", width/2, height/2);
      noLoop();
    }
    if ( ball.score2 == 10 ) {

      background (0, 0, 0);
      text ("Player 2 was too scared to continue", width/2, height/2);
      noLoop();
    }
  }
}