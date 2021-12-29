class Grass
{
  float x;
  float y;
  float grassHeight;
  color grassColor;
  int maxGrassHeight;
}

//number of blades of grass to display - also the array limit
int numOfBlades = 200;

//declare and create new array
Grass[] bladesOfGrass = new Grass[numOfBlades];

float growSpeed = 0.5; 


void setup()
{
  size(800, 500);
  
  // initialize values of x and y, initialize / create new Object 
  for (int i = 0; i < numOfBlades; i++)
  {
    bladesOfGrass[i] = new Grass();
    bladesOfGrass[i].x = random(50, 750);
    bladesOfGrass[i].y = random(50, 450);
    bladesOfGrass[i].grassHeight = 0;
    bladesOfGrass[i].grassColor = color(random(50, 150) , random(150, 255), random(50, 100));
    bladesOfGrass[i].maxGrassHeight = 50;
  }

}


void draw()
{
  background(245, 226, 178);
  
  drawGrass(bladesOfGrass); 
  growGrass(bladesOfGrass);
  
}


void drawGrass(Grass[] inputGrass)
{
  
  int grassWidth = 5;
  
  for (int i = 0; i < numOfBlades; i++)
  {
    rectMode(CENTER);
    stroke(0);
    fill(inputGrass[i].grassColor);
    rect(inputGrass[i].x, inputGrass[i].y - inputGrass[i].grassHeight/2, grassWidth, inputGrass[i].grassHeight);  
  
  }
    
}


void growGrass(Grass[] inputGrass)
{
  
  for (int i = 0; i < numOfBlades; i++)
  {
    
    if (inputGrass[i].grassHeight < inputGrass[i].maxGrassHeight)
    {
      inputGrass[i].grassHeight += growSpeed;
      
      if(inputGrass[i].grassHeight > inputGrass[i].maxGrassHeight){
        
        inputGrass[i].grassHeight = inputGrass[i].maxGrassHeight;        
      }
    }

  }

}


void mouseClicked(){
  
  //when the mouse is clicked, height of grass is reset to zero.
  
  for (int i = 0; i < numOfBlades; i++)
  {
    bladesOfGrass[i].grassHeight = 0;
  
  } 
  
}
