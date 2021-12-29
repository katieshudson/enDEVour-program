class Grass
{
  float x;
  float y;
}

//number of blades of grass to display - also the array limit
int numOfBlades = 600;

//declare and create new array
Grass[] bladesOfGrass = new Grass[numOfBlades]; 


void setup()
{
  size(800, 500);
  
  // initialize values of x and y, initialize / create new Object 
  for (int i = 0; i < numOfBlades; i++)
  {
    bladesOfGrass[i] = new Grass();
    bladesOfGrass[i].x = random(50, 750);
    bladesOfGrass[i].y = random(50, 450);    
  }

}


void draw()
{
  background(245, 226, 178);
  
  drawGrass(bladesOfGrass); 
}



void drawGrass(Grass[] inputGrass)
{
  
  int grassWidth = 5;
  int grassHeight = 20;
  
  for (int i = 0; i < numOfBlades; i++)
  {
    rectMode(CENTER);
    stroke(0);
    fill(2, 149, 17);
    rect(inputGrass[i].x, inputGrass[i].y, grassWidth, grassHeight);  
  
  }
    
}
