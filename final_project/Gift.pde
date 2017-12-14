// GIFT CLASS

class Gift {

  // VARIABLES
  int x;
  int y;
  int vx;

  PImage img;

  int SIDE[] = new int[2];
  int sidearray;

  boolean clicked = false;

  // These variables allow the Gift Chiyo to have unique coordinates and images
  Gift (int _x, int _y, int _vx, PImage _img) {
    x = _x;
    y = _y;
    vx = _vx;
    img = _img;
    SIDE[0]= width+50;
    SIDE[1]= -50;
  }
  
  // Displays the chiyo image in the location assigned to it 
  void display() {
    image(img, x, y);
    // After every 75 frames or about 12 seconds a gift chiyo will cross the screen
    // Starting from a random side and height
    if (frameCount % 75 == 0) {
      sidearray = (int) floor(random(0, 2));
      x = SIDE[sidearray];
      y = (int) random (10, (height-40));
      clicked = false;
    }
  }

  // Gift Chiyo movement
  void update() {
    // If sidearray is 0 it means the gift chiyo starts from the right
    // And moves towards the left 
    if ( sidearray == 0 ) {
      vx = -40;
      x += vx;
    }

    // If sidearray is 1 it means the gift chiyo starts from the right
    // And moves towards the left 
    if ( sidearray == 1 ) {
      vx = 40;
      x += vx;
    }
  }

  // Whenever the gift Chiyo shows up, if the player is quick enough to mouse over it 
  // It'll play a meowing sound and add 1 point to the player's lives
  void life() {
    if ((mouseX <= (gift.x + targetSize) && mouseX >= (gift.x)) && 
      (mouseY <= (gift.y + targetSize) && mouseY >= (gift.y)) && millis()>50) {
      meow2.play();
      if (gift.clicked == false) {
        lives +=1;
        gift.clicked = true;
      }
  }
}
}