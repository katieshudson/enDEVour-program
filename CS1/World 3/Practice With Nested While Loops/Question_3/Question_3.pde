// number of squares 
int numSquares = 10;

// x and y coordinate variables
float rectX;
float rectY;

// type of font and text variable to write numbers
PFont fontTypeThin;
PFont fontTypeBold;
int text; // variable to display the numbers in times table

void setup()
{
  size(800, 800);
  background(255);
  rectMode(CENTER);
  
  fontTypeThin = loadFont("AppleSDGothicNeo-Thin-30.vlw");
  fontTypeBold = loadFont("AppleSDGothicNeo-Heavy-30.vlw");

}

void draw()
{
  
  float rectWidth = width/numSquares;
  float rectHeight = height/numSquares;
  
  
  int squareRowNum = 0;
  while (squareRowNum < numSquares)
  {
    int squareColNum = 0;
    while(squareColNum < numSquares)
    {
      float rectX = rectWidth/2 + rectWidth*(squareColNum);
      float rectY = rectHeight/2 + rectHeight*(squareRowNum);
      
      if(squareColNum == 0 || squareRowNum == 0)
      {
        text = squareColNum + squareRowNum; // border of numbers 
        textFont(fontTypeBold); // emphasize the border numbers
        
      } else {
      
        text = squareColNum * squareRowNum; // multiplication calculation for timestable
        textFont(fontTypeThin); // distinguish the calculation in the timestable
        
      }
      
      fill(0); // text color black
      textAlign(CENTER);
      
      if(text != 0){  // to eliminate the 0 that would appear, so it's just 1x1 through to 9x9
        text(text, rectX, rectY); 
      }  
      
      stroke(0); // grid color black
      noFill(); // square color transparent 
      rect(rectX, rectY, rectWidth, rectHeight);
      
      squareColNum++;
          
    }
    
    squareRowNum++;
  
  }
 
}
