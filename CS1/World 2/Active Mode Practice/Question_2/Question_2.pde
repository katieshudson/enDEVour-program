 //sketch level variables
  float circleX;
  float circleY;
  float circleDiameter = 30;


void setup()
{
 
  //Things that only happen once
   size(800,400);
   background(206,206,206);
   fill(0);
  
  //x and y coordinates relative to size of window
  circleX = width/4;
  circleY = height*7/8;
}

void draw()
{
 movingCircle(); 
}

void movingCircle()
{  
  //clear out old frames
  background(206,206,206);
  
  //starting point - first frame 
  ellipseMode(CENTER);
  ellipse(circleX, circleY, circleDiameter, circleDiameter);
  
  //modify state
  circleX = circleX +1;
  
}
