final int pumpkinWidth = 89;
final int pumpkinHeight = 71;
int numOfPumpkins = 7;

class Pumpkin
{
  float x;
  float y;
  boolean jackOLantern;

  Pumpkin(float newX, float newY, int jackOLanternBinary)
  {
    this.x = newX;
    this.y = newY;
    if (jackOLanternBinary == 0) 
    {
      this.jackOLantern = false;
      
    } else {
        this.jackOLantern = true;
    }
    
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
    pumpkinPatch[i] = new Pumpkin(random(100, 700), random(100, 500), (int)random(2)); // create new object in array at index [i]
    
  }
 
}

void draw()
{
  drawPumpkin(pumpkinPatch);
}

void drawPumpkin(Pumpkin[] p)
{
  
  int smileDiameter = 45;
  int eyeDiameter = 10;
  
  for (int i = 0; i < numOfPumpkins; i++)
  {
    
    // pumpkin body
    fill(232, 117, 23);
    ellipse(p[i].x, p[i].y, pumpkinWidth, pumpkinHeight);
    
    // stem
    fill(0, 120, 0);
    quad(p[i].x - 3, p[i].y - pumpkinHeight/2 + 5, 
         p[i].x - 5, p[i].y - pumpkinHeight/2 - 5, 
         p[i].x + 5, p[i].y - pumpkinHeight/2 - 5, 
         p[i].x + 3, p[i].y - pumpkinHeight/2 + 5);
  
    if (pumpkinPatch[i].jackOLantern == true)
    {
    
      //Left Eye 
      noStroke();
      fill(0);
      ellipseMode(CENTER);
      ellipse(p[i].x - 15, p[i].y - 15, eyeDiameter, eyeDiameter);
    
      // Right Eye
      noStroke();
      fill(0);
      ellipseMode(CENTER);
      ellipse(p[i].x + 15, p[i].y - 15, eyeDiameter, eyeDiameter);
      
      // nose 
      noStroke();
      fill(0);
      triangle(p[i].x - 8, p[i].y + 3, p[i].x, p[i].y - 10, p[i].x + 8, p[i].y + 3);
      
      //mouth 
      noStroke();
      fill(0);
      arc(p[i].x, p[i].y + 10, smileDiameter +5, smileDiameter - 5, 0, PI);
    
    }
      
  }  
  
}
