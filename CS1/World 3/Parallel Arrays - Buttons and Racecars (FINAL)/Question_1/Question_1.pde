
int numRect = 5;  //user choses the number of rectangles to draw


float rectWidth;
int rectHeight = 150;

float[] rectX = new float[numRect];
float[] rectY = new float[numRect];

color[] arrayAltColorForRect = new color[numRect]; // alternate color array

color originalRectColor = color(4, 219, 131); // original color of rectangles - green

color[] arrayRectColorChoices = // color choices for the rectangles 
{
  color(3, 16, 252),  // blue
  color(148, 86, 237),  // purple
  color(252, 255, 95),   // yellow
  color(255, 147, 255),  // pink
  color(255, 170, 0)      // orange
};


void setup()
{
  size(800,500);
  fill(originalRectColor);
  rectMode(CENTER);
  
  rectWidth = width/numRect;
  
  int rectCounter = 0;
  while (rectCounter < numRect)
  {
    rectX[rectCounter] = rectWidth*(rectCounter) + (rectWidth/2);
    rectY[rectCounter] = height/2;
    
    rectCounter++;
  }
  
  initializeAlternateColorArray();
  
}

void initializeAlternateColorArray() // define the alternate colors for every rect dynamically  
{

  //iterate through the Alterante color array and assign an alt color for every rect 
  int rectCounter = 0;
  while (rectCounter < numRect)
  {
    arrayAltColorForRect[rectCounter] = arrayRectColorChoices[rectCounter % arrayRectColorChoices.length]; 
    
    rectCounter++;
  }
  

}

void draw()
{
  background(255);
  
  drawAllRect();
  checkMousePosition();
  
}

void drawAllRect()
{
   
  int rectCounter = 0;
  while (rectCounter < numRect)
  {
    
    stroke(0);
    strokeWeight(2);
    rect(rectX[rectCounter], rectY[rectCounter], rectWidth, rectHeight);
    
    rectCounter++;
  
  }

}

void checkMousePosition()
{
  int rectCounter = 0;
  
  if ((mouseY > (rectY[rectCounter] - rectHeight/2)) && (mouseY < (rectY[rectCounter] + rectHeight/2))) // check if mouse is within the rect boundaries
  {
        
    while (rectCounter < numRect)
    {
      
      float rectLeftEdge = (rectX[rectCounter] - rectWidth/2);
      float rectRightEdge = (rectX[rectCounter] + rectWidth/2);
      
      if (mouseX > rectLeftEdge && mouseX < rectRightEdge)
      {
        fill(arrayAltColorForRect[rectCounter]);
        rect(rectX[rectCounter], rectY[rectCounter], rectWidth, rectHeight);
        fill(originalRectColor);
      }
      
      rectCounter++;
    
    }
  } else {    
    
    fill(originalRectColor); // if within the rect boundaries, then use original rect color green
  }  
  
}
