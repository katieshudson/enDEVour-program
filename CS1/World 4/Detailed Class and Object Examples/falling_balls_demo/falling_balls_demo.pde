class Circle
{
  int x;
  float y;
  float speed;
}

final int numCircles = 50;

Circle[] circles = new Circle[numCircles];

final int initialY = 20;

void setup()
{
  size(500,500);
  int circleNum = 0;
  while (circleNum < numCircles)
  {
    circles[circleNum] = new Circle();
    circles[circleNum].x = (int)random(width);
    circles[circleNum].y = initialY;
    circles[circleNum].speed = random(1,5);
 
   circleNum++;
  }
}

void draw()
{
  background(255);
 
  int circleNum = 0;
  while (circleNum < numCircles)
  {
    fill(random(0,255), random(0,255), random(0,255));
    ellipse(circles[circleNum].x, circles[circleNum].y, 10, 10);
    circles[circleNum].y += circles[circleNum].speed;
    circleNum++;
  }
}
