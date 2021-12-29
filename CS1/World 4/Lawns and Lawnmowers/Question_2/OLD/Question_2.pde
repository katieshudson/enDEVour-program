class Grass
{
  float x;
  float y;
  int grassWidth;
  int grassHeight;
}

//Grass bladeOfGrass;
int numOfBlades = 2500; 
int initialX = 20;
int initialY = 20;

Grass[] blades = new Grass[numOfBlades];

void setup() 
{
 
  size(800, 500);
  
  int bladeNum = 0;
  while (bladeNum < numOfBlades)
  {
    blades[bladeNum] = new Grass();
    blades[bladeNum].x = initialX + random(1, 750);
    blades[bladeNum].y = initialY + random(1, 450);
    blades[bladeNum].grassWidth = 5;
    blades[bladeNum].grassHeight = 20;
    
    bladeNum++;
  }
 
}


void draw()
{
  background(245, 226, 178);
         
  drawPatchOfGrass(blades, 50, 50);
}

void drawGrass(Grass bladeOfGrass)
{
 
  rectMode(CENTER);
  stroke(0);
  fill(2, 149, 17);
  rect(bladeOfGrass.x, bladeOfGrass.y, bladeOfGrass.grassWidth, bladeOfGrass.grassHeight);

}


void drawPatchOfGrass(Grass[] blades, int n, int m)
{
  
  // n = columns 
  // m = rows 
  
  int rowNum = 0;
  int i = 0;
  while (rowNum < m)
  {
    int colNum = 0;
    while (colNum < n)
    {
      
      drawGrass(blades[i]);
      
      colNum++;
      i++;
    }
    
    rowNum++;
 
  }
  
}
