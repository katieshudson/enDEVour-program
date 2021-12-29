class Grass
{
  float x;
  float y;
}

Grass bladeOfGrass;

void setup() 
{
  
  size(800, 500);
  bladeOfGrass = new Grass();
  bladeOfGrass.x = width/2;
  bladeOfGrass.y = height/2;
}


void draw()
{
  background(245, 226, 178);
  drawGrass(bladeOfGrass);

}

void drawGrass(Grass inputGrass)
{
  
  int grassWidth = 5;
  int grassHeight = 20;
  
  rectMode(CENTER);
  stroke(0);
  fill(2, 149, 17);
  rect(inputGrass.x, inputGrass.y, grassWidth, grassHeight);
  
}
