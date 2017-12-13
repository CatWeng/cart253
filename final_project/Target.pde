// TARGET CLASS

class Target {

  // VARIABLES
  int x;
  int y;
  int size;

  PImage img;

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

  // Made 'found' it's own function so more content may be added later
  void found() {
    mouseClicked();
  }

  // Detects if the mouse is clicked within the area of the hidden Chiyo
  // If it is, tells the indicator to load the black and white image
  void mouseClicked() {
    if (mousePressed==true) {
      if ((mouseX <= (catIcon.x + targetSize) && mouseX >= (catIcon.x)) && 
        (mouseY <= (catIcon.y + targetSize) && mouseY >= (catIcon.y))) {
        catTarget.img = targetFound;
      }
    }
  }
}