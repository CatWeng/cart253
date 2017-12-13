// TARGET CLASS

class Target {

  // VARIABLES
  int x;
  int y;
  int size;

  PImage img;
  
  //Booleans to check if the Chiyo has been found yet
  boolean clicked = false;
  boolean clicked2 = false;
  boolean clicked3 = false;

  // These variables allow the Chiyos to have unique coordinates and images
  Target (int _x, int _y, int _size, PImage _img) {

    x = _x;
    y = _y;
    img = _img;
    size = _size;
  }

  // Displays the chiyo image in the location assigned to it 
  void display() {
    image(img, x, y, size, size);
  }

  // Detects if the mouse is clicked within the area of the hidden Chiyo
  // If it is, tells the indicator to load the black and white image + awards the player a point
  // If clicked outside of the Chiyo area then the player is penalized one point.
  void mouseClicked() {
    if ((mouseX <= (catIcon.x + targetSize) && mouseX >= (catIcon.x)) && 
      (mouseY <= (catIcon.y + targetSize) && mouseY >= (catIcon.y))) {
      catTarget.img = targetFound;
      if (clicked == false) {
        win+=1;
        clicked = true;
      }
    } else if ((mouseX <= (catIcon2.x + targetSize) && mouseX >= (catIcon2.x)) && 
      (mouseY <= (catIcon2.y + targetSize) && mouseY >= (catIcon2.y))) {
      catTarget2.img = targetFound2;
      if (clicked2 == false) {
        win +=1;
        clicked2 = true;
      }
    } else if ((mouseX <= (catIcon3.x + targetSize) && mouseX >= (catIcon3.x)) && 
      (mouseY <= (catIcon3.y + targetSize) && mouseY >= (catIcon3.y))) {
      catTarget3.img = targetFound3;
      if (clicked3 == false) {
        win +=1;
        clicked3 = true;
      }
    } else if (mouseX >= 480) {
    } else {
      lives -= 1;
    }
  }
}