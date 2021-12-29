final int pumpkinWidth = 89;
final int pumpkinHeight = 71;
int numOfPumpkins = 7;

class Pumpkin
{
  float x;
  float y;
  boolean jackOLantern;
  boolean lightOn;
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
    pumpkinPatch[i] = new Pumpkin(); // create new object in array at index [i] 
  }
  
  initPumpkins(pumpkinPatch);

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
  
    if (p[i].jackOLantern == true)
    {
      
      if(p[i].lightOn == false)
      {
        fill(0);
      } else {
        fill(254,255,59);
        }
        
      //Left Eye 
      noStroke();
      ellipseMode(CENTER);
      ellipse(p[i].x - 15, p[i].y - 15, eyeDiameter, eyeDiameter);
    
      // Right Eye
      noStroke();
      ellipseMode(CENTER);
      ellipse(p[i].x + 15, p[i].y - 15, eyeDiameter, eyeDiameter);
      
      // nose 
      noStroke();
      triangle(p[i].x - 8, p[i].y + 3, p[i].x, p[i].y - 10, p[i].x + 8, p[i].y + 3);
      
      //mouth 
      noStroke();
      arc(p[i].x, p[i].y + 10, smileDiameter +5, smileDiameter - 5, 0, PI);
    
    }
      
  }  
  
}

void initPumpkins(Pumpkin[] patch)
{

  float spaceBetween;
  int jackOLanterBinary;
  
  for (int i = 0; i < numOfPumpkins; i++)
  {
    
    spaceBetween = width/numOfPumpkins;
    patch[i].x = spaceBetween*i + spaceBetween/2;
    patch[i].y = height/2;
    jackOLanterBinary = (int)random(2); // 50% probability 
    patch[i].lightOn = false;
    
    if (jackOLanterBinary == 0) 
    {
      patch[i].jackOLantern = false;
      
    } else {
       patch[i].jackOLantern = true;
    }
    
  }
  
}

void lightCandle()
{
  
  
  for(int i = 0; i < numOfPumpkins; i++)
  {
   
    if(pumpkinPatch[i].jackOLantern == true)
    {
      fill(254,255,59);
    }
   
  }

}

void mouseClicked()
{

 
  for(int i = 0; i < numOfPumpkins; i++)
  {
    // is the mouse within the boundaries of the pumpkin[i]?
    if(dist(pumpkinPatch[i].x, pumpkinPatch[i].y, mouseX, mouseY) < pumpkinWidth/2)
    {    
      if(pumpkinPatch[i].jackOLantern == false)
      {
        pumpkinPatch[i].jackOLantern = true;
      } else {
        
        pumpkinPatch[i].lightOn = true;
        
      }
        
    }
  }
  
}
