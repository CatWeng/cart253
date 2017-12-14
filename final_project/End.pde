// END CLASS

class End {

  // VARIABLES
  int x;
  int y;
  int endwidth;
  int endheight;

  PImage img;
  PImage scream;
  PImage leggy;

  // Variables to draw the end screen
  End (int _x, int _y, int _endwidth, int _endheight, PImage _img) {
    x = _x;
    y = _y;
    img = _img;
    endwidth=_endwidth;
    endheight=_endheight;
  }

  // When the player's points reach 0, the game ends
  // The player is greeted by the words 'GAME OVER' and an angry Chiyo
  // Also plays the sound of a cat crying
  void lose() {
    scream = loadImage ("scream.png");
    scream.resize(108, 128);
    endscreen = loadImage ("endscreen.png");
    endscreen.resize(width, height);
    if (lives == 0) {
      image (endscreen, 0, 0);
      image (scream, width-130, height-150);
      stop();
      cry.play();
    }
  }
  
  // When the player find all the hidden Chiyos, the game ends
  // The player is greeted by the words 'YOU WIN' and a happy Chiyo in heels
  // Also plays the sound of a happy cat purring
  void win() {
    leggy = loadImage ("zleggy.png");
    leggy.resize(150, 150);
    endscreen = loadImage ("winscreen.png");
    endscreen.resize(width, height);
    if (win == 3) {
      image (endscreen, 0, 0);
      image (leggy, width-150, height-170);
      stop();
      purr.play();
    }
  }
  
}