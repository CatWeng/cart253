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
    image(img, x, y);
  }
}