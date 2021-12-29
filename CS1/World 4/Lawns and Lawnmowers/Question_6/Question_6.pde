class Grass
{
  float x;
  float y;
  float grassHeight;
  int grassWidth;
  color grassColor;
  int maxGrassHeight;
}

//number of blades of grass to display - also the array limit
int numOfBlades = 200;

//declare and create new array
Grass[] bladesOfGrass = new Grass[numOfBlades];

float growSpeed = 0.2;

//global variables for mower 
int mowerHeight = 30;
int mowerWidth = 75;

void setup()
{
  size(800, 500);
  
  // initialize values of x and y, initialize and create new Grass Object in each array index
  for (int i = 0; i < numOfBlades; i++)
  {
    bladesOfGrass[i] = new Grass();
    bladesOfGrass[i].x = random(50, 750);
    bladesOfGrass[i].y = random(50, 450);
    bladesOfGrass[i].grassHeight = 0;
    bladesOfGrass[i].grassWidth = 5;
    bladesOfGrass[i].grassColor = color(random(50, 150) , random(150, 255), random(50, 100));
    bladesOfGrass[i].maxGrassHeight = 50;
  }

}


void draw()
{
  background(245, 226, 178);
  
  drawGrass(bladesOfGrass); 
  growGrass(bladesOfGrass);
  drawMower();
  mowerCutGrass(bladesOfGrass);
  
}


void drawGrass(Grass[] inputGrass)
{
   
  for (int i = 0; i < numOfBlades; i++)
  {
    rectMode(CENTER);
    stroke(0);
    fill(inputGrass[i].grassColor);
    rect(inputGrass[i].x, inputGrass[i].y - inputGrass[i].grassHeight/2, inputGrass[i].grassWidth, inputGrass[i].grassHeight);  
  }
    
}

void drawMower()
{
  // mower center point variables
  float mowerX = mouseX;
  float mowerY = mouseY;
  
  //mower body variables 
  float mowerBodyX = mowerX;
  float mowerBodyY = mowerY - 5;
  
  // wheel variables 
  int wheelDiameter = 12;
  int wheelOffset = 7;
  float leftWheelX = mowerX - mowerWidth/2 + wheelOffset;
  float rightWheelX = mowerX + mowerWidth/2 - wheelOffset;
  float WheelY = mowerY + mowerHeight/2;
  
  //mower handle variables
  float handleX = mowerX + mowerWidth/2 - 2;
  float handleY = mowerY - mowerHeight - 5;
  int handleWidth = 5;
  int handleHeight = 50;

  //Mower Body
  fill(227, 25, 25); //red
  rect(mowerBodyX, mowerBodyY, mowerWidth, mowerHeight);
  
  // Left Wheel
  fill(0);
  ellipse(leftWheelX, WheelY, wheelDiameter, wheelDiameter); 
  
  // Right Wheel 
  fill(0);
  ellipse(rightWheelX, WheelY, wheelDiameter, wheelDiameter); 
  
  // Mower Handle 
  rect(handleX, handleY, handleWidth, handleHeight);
  
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


void mowerCutGrass(Grass[] inputGrass)
{
  
  for (int i = 0; i < numOfBlades; i++)
  {  
    
    if((inputGrass[i].y < (mouseY + mowerHeight/2) && (inputGrass[i].y > mouseY)) &&
        (inputGrass[i].x < (mouseX + mowerWidth/2) && (inputGrass[i].x > (mouseX - mowerWidth/2)))) // is the blade of grass within the mower body range?
    {
      
      if(inputGrass[i].grassHeight >= mowerHeight) // if the Grass Height is equal or greater than mower height, then cut grass
      {
          
        inputGrass[i].grassHeight = 10;           
      }
    
    }
  
  }
}
