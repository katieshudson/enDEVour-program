PFont boxFont;

//Box width and height variables
float boxWidth = 150;
float boxHeight = 300;

//Box x,y coordinate variables
float middleBoxPositionX;
float leftBoxPositionX;
float rightBoxPositionX;
float boxPositionY;

//Original Box Color Variables  
color boxColor1 = color(152, 234, 38); //green 
color boxColor2 = color(65, 145, 240); //blue 
color boxColor3 = color(181, 104, 229); // purple

//New colors when key is pressed 
color boxColor4 = color(227, 69, 79); //red
color boxColor5 = color(255, 132, 0); //orange
color boxColor6 = color(249, 255, 98); //yellow

// Box color variables at every moment
color boxColorA = boxColor1;
color boxColorB = boxColor2;
color boxColorC = boxColor3;


//setting up things I only need once 
void setup()
{
    size(800,500);
    background(162, 211, 173);
    
    stroke(0);
    strokeWeight(2);
    rectMode(CENTER);
    
    //box X and Y coordinates
    middleBoxPositionX = width/2; // x coordinate of Box A
    leftBoxPositionX = middleBoxPositionX - boxWidth/2 - 150; // x coordinate of Box B
    rightBoxPositionX = middleBoxPositionX + boxWidth/2 + 150; // x coordinate of Box C
    boxPositionY = height/2; // y coordinate of every Box
    
    //setting up the font type, size, and alignment 
    boxFont = loadFont("AdobeGothicStd-Bold-48.vlw"); //loading a particular font 
    textFont(boxFont, 48);
    textAlign(CENTER, CENTER); // horizontal and vertical align

}


void draw()
{

    drawBox(leftBoxPositionX, boxPositionY, boxColorA, "A");
    drawBox(middleBoxPositionX, boxPositionY, boxColorB, "B");
    drawBox(rightBoxPositionX, boxPositionY, boxColorC, "C");

}


void drawBox(float inputBoxPositionX, float inputBoxPositionY, color inputBoxColor, String boxLetter)
{

    stroke(0);
    strokeWeight(2);
  
    fill(inputBoxColor);
    rect(inputBoxPositionX, inputBoxPositionY, boxWidth, boxHeight);
  
    fill(0);
    text(boxLetter, inputBoxPositionX, inputBoxPositionY);
  }


void keyPressed()
{
   
    //user chooses a letter: A, B or C, when pressed the box will change colour. 
    // If pressed again, it will change back to its original color.
    switch(key)
    {
    
      //when the a key is pressed
      case 'a':

        print("case A");
      
        //when the a key is pressed, if boxcolorA is assigned to its original value boxcolor1, then assign it to boxColor4       
        if (boxColorA == boxColor1)
        {
          print("case A1");
          boxColorA = boxColor4;     
        } 
        
        //when the a key is pressed, if boxColorA is anything but its original color, then assign it back to its original color
        else
        {
          print("case A2");
          boxColorA = boxColor1;
        }
      break;
            
      
      case 'b':
        
        print("case B");
    
        //when the b key is pressed, if boxColorB is assigned to its original value boxColor2, then assign it to boxColor5              
        if (boxColorB == boxColor2)
        {
          print("case B1");
          boxColorB = boxColor5;
        }
        
        //when the b key is pressed, if boxColorB is anything but its original color, then assign it back to its original color        
        else
        {
          print("case B2");
          boxColorB = boxColor2;
        }
      print("case B");  
      break;
      
      
      case 'c':
        
        print("case C");
        
        //when the c key is pressed, if boxColorC is assigned to its original value boxColor3, then assign it to boxColor6       
        if (boxColorC == boxColor3)
        {
          print("case C1");
          boxColorC = boxColor6;
        }

        //when the c key is pressed, if boxColorC is anything but its original color, then assign it back to its original color   
        else
        {
          print("case C2");
          boxColorC = boxColor3;
        }
      break;
      
      //if any other key is pressed, an error message will appear to instruct the user to select a valid key: A, B or C
      default:
        print("Please select a valid key: A, B or C");
        break;  
              
    }

}
