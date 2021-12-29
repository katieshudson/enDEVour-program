//rect variables 
float rectX;
float rectY;
float rectWidth = 300;
float rectHeight = 150;
  
//circle variables
float circleX;
float circleY;
float circleDiameter = 40;
float xSpeed = 4;
 
// creating a barrier variable or touchpoint to reference with the ball function
float rectTouchPoint;

//setting up things I only need once 
void setup()
{
  size(800,500);
  circleX = 20;
  circleY = height/2;
  rectX = width*2/3;
  rectY = height/2;
  rectTouchPoint = rectX - rectWidth/2;
}

//drawing my shapes
void draw()
{

  background(162, 211, 173);
  drawRectangle();
  drawBall();
  
}


// Drawing a rectangle function 
void drawRectangle()
{

  stroke(0);
  strokeWeight(2);
  fill(247, 213, 40);
  rectMode(CENTER);
  rect(rectX, rectY, rectWidth, rectHeight);
  
}

//Drawing the ball with conditions on how it can move or "bounce"
void drawBall()
{

 
  //starting point of the circle - first frame
  stroke(0);
  strokeWeight(2);
  fill(101,40,247);
  ellipse(circleX, circleY, circleDiameter, circleDiameter);
  
  
  //moving the circle formula
  circleX = circleX + xSpeed;
  
  
  // if the circle touches the edge of the rectangle, then change direction
  if ((circleX + circleDiameter/2) > rectTouchPoint)
  {
    xSpeed = xSpeed * -1;
  }
  
  //if the circle touches the edge of the left hand side of the canvas, then change direction
  if (circleX < 0 + circleDiameter/2)
  {
    xSpeed = xSpeed * -1;
  }
  
}
