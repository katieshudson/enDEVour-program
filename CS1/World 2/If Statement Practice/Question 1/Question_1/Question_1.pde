

void setup() 
{
  size(800,500);
  background(31,17,245);
  frameRate(50);
  
}

void draw()
{

  drawRandomCircle(random(width), random(height));
  
}

//Random Circle Function that includes if statements for circle/color conditions
void drawRandomCircle(float circleX, float circleY)
{

  float circleDiameter = 30;
  
  stroke(0);
  strokeWeight(2);
  ellipseMode(CENTER);


// if the circle x coordinate is less than half of the width of the canvas, draw random red circle
// if the circle x coordinate is more than half of the width of the canvas, draw random yellow circle
  if (circleX < width/2) {
    fill(245,17,25);
  }
   
  if (circleX > width/2) {
    fill(240,245,17);
}

ellipse(circleX, circleY, circleDiameter, circleDiameter);

}
