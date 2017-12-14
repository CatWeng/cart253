// FLY CLASS

class Fly {

  // VARIABLES
  int x;
  int y;
  float vx;
  float vy;

  PImage img;
  PImage chiyo;

  // These variables allow the Flies to have unique coordinates and images and velocity for movement
  Fly (int _x, int _y, int _vx, int _vy, PImage _img) {

    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    img = _img;
  }
  // Displays the chiyo image in the location assigned to it 
  // Resets starting velocity to a falling motion
  // Randomized images so all Chiyos are contantly being randomized
  void mouseClicked() {
    image(flyImg, x, y);
    flyImg = loadImage ((int)random(0, numImages)+".png");
    vx = 2;
    vy = 10;
  }

  // Updates the fly's velocity to speed up as it falls
  // Makes sure the Chiyos spread outwards 
  void update() {
    if (x >= mouseX) {
      vx = vx+ random (20);
    }
    if (x < mouseX) {
      vx = vx+ random (-20);
    }
    vy = vy + 20;
    x += vx;
    y += vy;
  }
}