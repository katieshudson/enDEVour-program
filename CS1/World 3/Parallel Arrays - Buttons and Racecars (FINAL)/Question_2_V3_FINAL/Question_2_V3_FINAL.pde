/* WELCOME TO THE FAST AND THE FURIOUS */

int numCars = 50; // user chooses car color 
boolean isRaceOn = true;

float carBodyWidth;
float carBodyHeight;
float carTopWidth;
float carTopHeight;

int initialCarX;

color[] arrayCarColorChoices = 
{
  color(3, 16, 252),        // blue
  color(148, 86, 237),      // purple
  color(252, 255, 95),      // yellow
  color(255, 147, 255),     // pink
  color(255, 170, 0),       // orange
  color(4, 219, 131),       // green
  color(5, 5, 5),           // black
  color(255, 3, 3),         // red
  color(3, 249, 255)        // light blue
};

String[] arrayCarColorNames = 
{
  "blue car",        // blue
  "purple car",      // purple
  "yellow car",      // yellow
  "pink car",        // pink
  "orange car",      // orange
  "green car",       // green
  "black car",       // black
  "red car",         // red
  "light blue car"   // light blue
};


color[] arrayAssignedCarColors = new color[numCars]; // array to assign colors to each car 

float[] carX = new float[numCars];
float[] carY = new float[numCars];
float[] carXSpeed = new float[numCars];



void setup()
{
  size(1000, 500);
  
  initializeCarColorChoices(); // assign car colors to n cars 
  
  initialCarX = 30; // all cars start at same X coordinate 
  carBodyWidth = 50;
  carBodyHeight = 20;
  carTopWidth = 25;
  carTopHeight = 10;
  
  int carCounter = 0;
  while (carCounter < numCars)
  {        
    carX[carCounter] = initialCarX;
    carY[carCounter] = (int)random(30, height - 50);
    carXSpeed[carCounter] = random(1, 5); // random speed generator 
    
    carCounter++;
  }
  
}


void initializeCarColorChoices()
{  
  //iterate through the car color array and assign a color for n cars
  int carCounter = 0;
  while (carCounter < numCars)
  {    
    arrayAssignedCarColors[carCounter] = arrayCarColorChoices[carCounter % arrayCarColorChoices.length];
  
    carCounter++;
  }
}


void draw()
{
  if(isRaceOn)
  {
    background(255);
    drawAllCars();
    moveCars();  
    checkFinishLineBoundary();
    
    if (frameCount % 30 == 0) // every 30 frames change the car speed
    {
      modifyCarSpeed();
    }
  }
}

void drawAllCars()
{
  
  int carCounter = 0;
  while (carCounter < numCars)
  {    
    carBodyWidth = 50;
    carBodyHeight = 20;
    
    carTopWidth = 30;
    carTopHeight = 10;
    
    float carBodyX = carX[carCounter]; 
    float carBodyY = carY[carCounter] + 15;
    float carTopX = carX[carCounter];
    float carTopY = carY[carCounter] - carTopHeight/3 + 4;
    float wheelX1 = carX[carCounter] - (carBodyWidth/4);
    float wheelX2 = carX[carCounter] + (carBodyWidth/4);
    float wheelY1 = carY[carCounter] + (carBodyHeight/2) + 16;
    float wheelY2 = carY[carCounter] + (carBodyHeight/2) + 16;    

    float wheelDiameter = 10;    
    
    rectMode(CENTER);
    noStroke();
    fill(arrayAssignedCarColors[carCounter]); 
    
    //wheels
    ellipseMode(CENTER);
    ellipse(wheelX1, wheelY1, wheelDiameter, wheelDiameter);
    ellipse(wheelX2, wheelY2, wheelDiameter, wheelDiameter);
    
    //top of car
    rect(carTopX, carTopY, carTopWidth, carTopHeight);
    
    //body of car 
    rect(carBodyX, carBodyY, carBodyWidth, carBodyHeight);
    
    carCounter++;
  }
}


void moveCars() // function to determine speed, inject randomness of speed
{
  
  int carCounter = 0;
  while (carCounter < numCars)
  {
    carX[carCounter] += carXSpeed[carCounter];
    
    carCounter++;
  }
    
}


void checkFinishLineBoundary()
{

  // race finishes when any car reaches the end of the screen (x > width)
  int carCounter = 0;

  
  while (carCounter < numCars) 
  {
    if (carX[carCounter] >= (width - 25)) // if a car reaches the finish line (x > width - offset)
    {
      isRaceOn = false;  
      println(arrayCarColorNames[carCounter % arrayCarColorNames.length] + " wins the race ");
    }
    
    carCounter++;
  }
  
}


void modifyCarSpeed()
{
  
  // after 30 frames modify car speed by random amount (car can slow or speed but never go in reverse)
  int carCounter = 0;
  while (carCounter < numCars)
  {
    carXSpeed[carCounter] += random(-5, 5);
    
    if (carXSpeed[carCounter] < 1) // check in the event the car speed becomes negative or zero.
    {
      carXSpeed[carCounter] = 1; // if the car speed is negative, then reset the car speed to positive 1;
    }
    
    carCounter++;
  }

}
