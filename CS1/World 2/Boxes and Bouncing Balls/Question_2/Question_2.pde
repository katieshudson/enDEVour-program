//circle variables
float circleX;
float circleY;
float circleDiameter = 40;
float xSpeed = 5;
float ySpeed = 5;


//setting up things I only need once 
void setup()
{
  size(800,500);
  background(162, 211, 173);
  circleX = 20;
  circleY = 20;
}

//drawing my shapes
void draw()
{

  drawCircle();
  
}


void drawCircle()
{
  //starting point of the circle - first frame
  stroke(0);
  strokeWeight(2);
  fill(101,40,247);
  ellipse(circleX, circleY, circleDiameter, circleDiameter);  
  
  //moving the circle formulas
  circleX = circleX + xSpeed;
  circleY = circleY + ySpeed;
  
  //marking the boundaries for the x coordinate 
  if (circleX > width || circleX < 0)
  {
    //change direction 
    xSpeed = xSpeed * -1;
  }
  
  //marketing the boundaries for the y coordinate 
  if (circleY > height || circleY < 0)
  {
    //change direction
    ySpeed = ySpeed * -1;
  }

}
