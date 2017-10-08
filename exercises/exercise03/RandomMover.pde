class RandomMover {
  
 int x;
 int y;
 int vx;
 int vy;
 int size;
 color fillColor;
 int timer=500;
 int newTime=500;

 RandomMover(int tempX, int tempY, int tempVX, int tempVY, int tempSize, color tempfillColor) {
   x = tempX;
   y = tempY;
   vx = tempVX;
   vy = tempVY;
   size = tempSize;
   fillColor = tempfillColor;
 }
 //Tells the progrma to keep checking if the ball needs to bounce or change color
 //and what direction the ball should be moving towards
 void update() {
   x += vx;
   y += vy;
   
   handleBounce();
   randomMove();
 }
 //Detects if the coordinates of the edges of the ball are in contact with
 //the walls and reverses the direction to keep it bouncing. 
 void handleBounce() {
   if (x - size/2 < 0 || x + size/2 > width) {
    vx = -vx; 
   }
   if (y - size/2 < 0 || y + size/2 > height) {
     vy = -vy;
   }
   x = constrain(x,size/2,width-size/2);
   y = constrain(y,size/2,height-size/2);
 }
 //CHANGED
 //Sets a timer that counts down as the sketch runs. Every 500 units
 //of time, it tells the ball to move in a random direction and speed 
 void randomMove() {
 timer--;
 if(timer<=0) {
vx =  (int) random (-5, 5);
vy =  (int) random (-5, 5); 
   timer=newTime;
 }
 
 }
//CHANGED with println so you can see when the ball will cange direction
 void draw() {
   println(timer);
   noStroke();
   fill(fillColor);
   ellipse(x,y,size,size);
 }
  
 }