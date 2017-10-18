// Creates two shrinking blue boxes over the background, one for each player.
// The box narrows a certain amount horizontally every time a point is lost.
// It also turns darker and darker blue as points are lost. 

class Box {

  // Set box location and size variables
  int x;
  int y;
  int boxx;
  int boxy;

  //The amount things decrease by with points lost. 
  int decrease=20; 

  //Sets the box colour
  color boxColor;

  //Sets box variables, placement, size and colour 
  Box(int _x, int _y, int _width, int _height, int _boxColor) {
    x = _x;
    y = _y;
    boxx = _width;
    boxy = _height;
    boxColor = _boxColor;
  }

  //Display the box, rectmode set to corner so they can shrink properly
  void display() {
    noStroke();
    fill(boxColor);
    rectMode(CORNER);
    rect(x, y, boxx, boxy);
  }

  // Updates the box so as the score increases, the size of the box is decreased. 
  // The paddle is moved inwards along with it, getting closer and closer to the center.
  // This also sets the colour of the box, decreasing by a certain amount with points
  // to gradually become darker and 'scarier'. 

  void update() {  
    if (ball.score1 > 0) {
      boxLeft.x = (ball.score1*decrease);
      boxLeft.boxx = (width-ball.score1*decrease);
      leftPaddle.x = (ball.score1*decrease)+(leftPaddle.WIDTH/2);
      boxLeft.boxColor = color(220-(ball.score1*decrease), 200-(ball.score1*decrease), 255-(ball.score1*decrease), 255-(ball.score1*decrease));
    }
    if (ball.score2 > 0) {
      boxRight.boxx = ((width/2)-(ball.score2*decrease));
      rightPaddle.x = (width-(ball.score2*decrease)-(rightPaddle.WIDTH/2));
      boxRight.boxColor = color(220-(ball.score2*decrease), 200-(ball.score2*decrease), 255-(ball.score2*decrease), 255-(ball.score2*decrease));
    }
  }
}