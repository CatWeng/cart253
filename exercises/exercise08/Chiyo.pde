// CHIYO CLASS

class Chiyo {

  // VARIABLES
  int x;
  int y;

  PImage img;

 // These variables allow the Chiyos to have unique coordinates and images
  Chiyo (int _x, int _y, PImage _img) {

    x = _x;
    y = _y;
    img = _img;
  }
// Displays the chiyo image in the location assigned to it 
  void display() {
    image(img, x, y);
  }
}