class Bouncer {
  
 int x;
 int y;
 int vx;
 int vy;
 int size;
 color fillColor;
 color defaultColor;
 color hoverColor;
 
 //Sets variables for 'bouncer' so it multiple be created with different starting location,
 //movement speed, direction, size and colors
 Bouncer(int tempX, int tempY, int tempVX, int tempVY, int tempSize, color tempDefaultColor, color tempHoverColor) {
   x = tempX;
   y = tempY;
   vx = tempVX;
   vy = tempVY;
   size = tempSize;
   defaultColor = tempDefaultColor;
   hoverColor = tempHoverColor;
   fillColor = defaultColor;
 }
 //Tells the progrma to keep checking if the ball needs to bounce or change color
 //and what direction the ball should be moving towards
 void update() {
   x += vx;
   y += vy;
   
   handleBounce();
   handleMouse();
 }
 //CHANGED
 //Detects if the coordinates of the edges of the ball are in contact with
 //the walls. When the ball comes into contact with either the left or right
 //wall then it wraps around to the other side. If it touches top or bottom
 //it keeps bouncing.
 void handleBounce() {
   if ( x - size/2 <= 0) {
    x = width-(size/2+1); 
   }
   if ( x + size/2 >= width) {
    x = 30;
   }
   if (y - size/2 < 0 || y + size/2 > height) {
    vy = -vy;
   }
   x = constrain(x,size/2,width-size/2);
   y = constrain(y,size/2,height-size/2);
 }
 //Detects if the mouse is touching the ball so it can change colour
 void handleMouse() {
   if (dist(mouseX,mouseY,x,y) < size/2) {
    fillColor = hoverColor; 
   }
   else {
     fillColor = defaultColor;
   }
 }
 //CHANGED
 //When the mouse is clicked, this sets the position of the ball to a random
 //place as well as increasing the movement speed.
  void mouseClicked(){
   if (mousePressed == true){
     x = (int) random(0, width);
     y = (int) random(0, width);
     background(backgroundColor);
     vx=vx+1;
     vy=vy+1;
   }
 }

//Keeps drawing the ball so it leaves a trail
 void draw() {
   noStroke();
   fill(fillColor);
   ellipse(x,y,size,size);
 }
  
 }