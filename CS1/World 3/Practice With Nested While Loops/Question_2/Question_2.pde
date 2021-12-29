// determine your board size! number of squares variable
int numSquares = 8;

// x and y coordinate variables
float rectX;
float rectY;

void setup()
{
  size(600, 600);
  background(250,255,3);
  rectMode(CENTER);

}

void draw()
{
  
  float spaceBetween = 2; // border between squares
  float rectWidth = (width - (numSquares + 1)*(spaceBetween))/numSquares;
  float rectHeight = (height - (numSquares + 1)*(spaceBetween))/numSquares;
  
  int squareRowNum = 0;
  while (squareRowNum < numSquares)
  {
    int squareColNum = 0;
    while(squareColNum < numSquares)
    {
      float rectX = spaceBetween*(squareColNum + 1) + (rectWidth/2) + rectWidth*(squareColNum);
      float rectY = spaceBetween*(squareRowNum + 1) + (rectHeight/2) + rectHeight*(squareRowNum);
      
      if((squareRowNum + squareColNum) % 2 == 0) // determining alternating colours
      {
        fill(255, 0, 0); // color - red
      } else { 
          fill(0); // color - black
      }
      
      rect(rectX, rectY, rectWidth, rectHeight);
            
      squareColNum++;
    
    }
    
    squareRowNum++;
  
  }
  
}
