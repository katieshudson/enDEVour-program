
color[] arrayOfColors = 
{
  color(255, 0, 0), // red
  color(255,153, 0), // orange
  color(255, 243, 0), // yellow 
  color(126, 211, 0),// green
  color(0, 116, 255),// blue 
}; //possible colours that the buttons can have

int[] arrayButtonColors = 
{
  0, // index 0
  1, // index 1
  2, // index 2
  3, // index 3
  4, // index 4
  0, // index 5
  1, // index 6
  2, // index 7
  3, // index 8
  4  // index 9
}; //for each button, which color each button is assigned at every moment

float rectX;
float rectY;
float rectWidth;
float rectHeight;

// number of Buttons to draw
int numButtons = 10;

void setup()
{
  size(800, 500);
  background(219, 219, 219);
}


void draw()
{
  
  drawAllButtons();

}

void drawAllButtons()
{
  
  rectWidth = width/10; 
  rectHeight = 50;
  
  int buttonCounter = 0;
  while (buttonCounter < numButtons)
  {
       
    rectX = rectWidth/2 + rectWidth*(buttonCounter);
    rectY = height/2;
                
    rectMode(CENTER);
    stroke(0);
    strokeWeight(2);
    int colorIndexForCurrentButton = arrayButtonColors[buttonCounter];
    fill(arrayOfColors[colorIndexForCurrentButton]);

    rect(rectX, rectY, rectWidth, rectHeight);
    buttonCounter++;
      
   }
    
}


void mouseClicked() // when the user clicks on a button, that button should change to the next color or start again if it reaches the color array length
{
 
  if ((mouseY > (rectY - rectHeight/2)) && (mouseY < (rectY + rectHeight/2))) // if the mouse is within the range of the button height on the y axis
  {
     
    int buttonCheckIndex = 0;
    while (buttonCheckIndex < numButtons)
    {
        float buttonLeftEdge = rectWidth*buttonCheckIndex;
        float buttonRightEdge = rectWidth*(buttonCheckIndex + 1);
        
        if(mouseX > buttonLeftEdge && mouseX < buttonRightEdge)
        {
          arrayButtonColors[buttonCheckIndex] = arrayButtonColors[buttonCheckIndex] + 1;
           
          if(arrayButtonColors[buttonCheckIndex] >= arrayOfColors.length)
           {
             arrayButtonColors[buttonCheckIndex] = 0;
           }
           
        }
        
        buttonCheckIndex++;
    }
    
  }

}
