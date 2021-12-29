class Ball
{
  int x;
  int y;
  int speed;

  final int size = 20;
}

Ball theBall;


void setup()
{
  size(500,500);

  theBall = new Ball();
  theBall.x = width/2;
  theBall.y = height/2;
  theBall.speed = 5;
  
}

void draw()
{
  background(255);
  moveBall(theBall);
  drawBall(theBall);
  
}


void moveBall(Ball b)
{
  b.x += b.speed;
  if (b.x < 0 || b.x > width)
  {
    b.speed *= -1;
  }
}

void drawBall(Ball b)
{
  ellipse(b.x, b.y, b.size, b.size);
}
