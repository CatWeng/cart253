//This code creates two semi-opaque balls, one red and one blue that bounce around diagonally 
//mirroring each other's movements. When the ball is moused-over the colour becomes brighter
//as long as the mouse remains in contact with the ball. When they meet in the middle it creates
//a blurred line because of the transparent colours overlapping.

color backgroundColor = color(200,150,150);
Bouncer bouncer;
Bouncer bouncer2;

//Creates 2 'bouncers', one blue and red, that start off in the middle and move out 
//diagonally down and outwards. Opacity is set to half and speed is slow. 
void setup() {
  size(640,480);
  background(backgroundColor);
  bouncer = new Bouncer(width/2,height/2,2,2,50,color(150,0,0,50),color(255,0,0,50));
  bouncer2 = new Bouncer(width/2,height/2,-2,2,50,color(0,0,150,50),color(0,0,255,50));
}
//Calls the bouncer functions
void draw() {
  bouncer.update();
  bouncer2.update();
  bouncer.draw();
  bouncer2.draw();
}