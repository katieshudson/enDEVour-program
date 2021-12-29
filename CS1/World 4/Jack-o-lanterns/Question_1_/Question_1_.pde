final int pumpkinWidth = 89;
final int pumpkinHeight = 71;
int numOfPumpkins = 7;

class Pumpkin
{
  float x;
  float y;

  Pumpkin(float newX, float newY)
  {
    x = newX;
    y = newY;
  }
}

// declare and initialize array to store pumpkin objects
Pumpkin[] pumpkinPatch = new Pumpkin[numOfPumpkins];

void setup()
{
  size(800, 600);
  background(0);
  smooth();
  
  for (int i = 0; i < numOfPumpkins; i++)
  {
    pumpkinPatch[i] = new Pumpkin(random(100, 700), random(100, 500)); // create new object in array at index [i]
  }
 
}

void draw()
{
  //Pumpkin p = new Pumpkin(width/2, height/2);
  
  drawPumpkin(pumpkinPatch);
}

void drawPumpkin(Pumpkin[] p)
{
  for (int i = 0; i < numOfPumpkins; i++)
  {
    fill(232, 117, 23);
    ellipse(p[i].x, p[i].y, pumpkinWidth, pumpkinHeight);

    fill(0, 120, 0);
    quad(p[i].x - 3, p[i].y - pumpkinHeight/2 + 5, 
         p[i].x - 5, p[i].y - pumpkinHeight/2 - 5, 
         p[i].x + 5, p[i].y - pumpkinHeight/2 - 5, 
         p[i].x + 3, p[i].y - pumpkinHeight/2 + 5);
  
  }
  
}
