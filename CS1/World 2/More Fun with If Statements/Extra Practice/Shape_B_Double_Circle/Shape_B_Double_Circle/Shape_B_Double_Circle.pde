float drawingCircleDiameter;
float circleBoundary1Diameter;
float circleBoundary2Diameter;

float circleX;
float circleY;


float midPointAnchor;

void setup()
{
  size(800,500);
  smooth();
  
  midPointAnchor = width/2;

}


void draw()
{
  determineRandomCoordinate();
  determineCircleColor();
  drawCircle();

}


void determineRandomCoordinate()
{
  
  circleX = random(0, width);
  circleY = random(0, height);

}

void determineCircleColor()
{
  circleBoundary1Diameter = 125;
  circleBoundary2Diameter = 250;
  
  float distanceToCenterPoint = dist(circleX, circleY, width/2, height/2);

  // determine boundaries, and color
  if (distanceToCenterPoint >= circleBoundary1Diameter && distanceToCenterPoint <= circleBoundary2Diameter)
      {
        fill(0, 70, 255); //blue
      
      } else 
        {
          fill(20, 255, 0); // green

        }
}        

void drawCircle()
{
  
 
  float drawingCircleDiameter = 40;
  
  noStroke();
  ellipseMode(CENTER);
  ellipse(circleX, circleY, drawingCircleDiameter, drawingCircleDiameter);
  

}
