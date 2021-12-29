

void setup() 
{
  size(800,500);
  background(64,185,56);
  frameRate(15);
  

  
}

void draw()
{

  drawYellowCircle(random(width), random(height));
  
}

void drawYellowCircle(float circleX, float circleY)
{

  float circleDiameter = 15;
  
  noStroke();
  fill(255,255,0);
  ellipseMode(CENTER);
  ellipse(circleX, circleY, circleDiameter, circleDiameter);

}
