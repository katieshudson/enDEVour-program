class Grass
{
  float x;
  float y;
}

int numColumns;
int numRows;

Grass bladeOfGrass;

void setup()
{
  size(800, 500);
  
  numRows = 10;
  numColumns = 10;

}


void draw()
{

  drawGridOfGrass(numRows, numColumns);

}

void drawGrass(Grass inputGrass)
{
  
  int grassWidth = 5;
  int grassHeight = 15;
  
  rectMode(CENTER);
  stroke(0);
  fill(2, 149, 17);
  rect(inputGrass.x, inputGrass.y, grassWidth, grassHeight);

}

void drawGridOfGrass(int n, int m)
{
  
  // rows = n
  // columns = m
  
  float cellWidth = width / m;
  float cellHeight = height/ n;
  
  int rowNum = 0;
  while (rowNum < n)
  {
      
      int colNum = 0;
      while (colNum < m)
      {
        
        bladeOfGrass = new Grass();
        bladeOfGrass.x = cellWidth/2 + cellWidth*colNum;
        bladeOfGrass.y = cellHeight/2 + cellHeight*rowNum;
        
        drawGrass(bladeOfGrass);
        
        colNum++;
        
      }
    
    rowNum++;
  }

}
