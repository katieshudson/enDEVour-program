// variables for counting windows and stories 
int numWindows = 10;
int numStories = 20;

// width and height variables for skyscraper 
float skyscraperWidth;
float skyscraperHeight;

// x and y coordinate variables 
float skyscraperX;
float skyscraperY;
float windowX; 
float windowY;



void setup()
{
  
  size(600, 1000);
  background(209, 248, 255);
  rectMode(CENTER);

}

void draw()
{
  
  drawSkyscraper();
  
  int spaceBetweenWindows = 10;
  int spaceBetweenStories = 30;
  float windowWidth = (skyscraperWidth - ((numWindows + 1)*spaceBetweenWindows))/numWindows;
  float windowHeight = (skyscraperHeight - ((numStories + 1)*spaceBetweenStories))/numStories;
  
  int offsetX = 150;
  int offsetY = 200;
  
  int windowRowNum = 0;
  while (windowRowNum < numStories)
  {
  
    int windowColNum = 0;
    while (windowColNum < numWindows)
    {
      
      windowX = spaceBetweenWindows*(windowColNum + 1) + (windowWidth/2) + (windowWidth)*(windowColNum) + offsetX;
      windowY = spaceBetweenStories*(windowRowNum + 1) + (windowHeight/2) + (windowHeight)*(windowRowNum) + offsetY;
      
      stroke(0);
      strokeWeight(1);
      fill(255);
      rect(windowX, windowY, windowWidth, windowHeight);
      
      windowColNum++;
    
    }
    
   windowRowNum++;
  
  }
  
}

void drawSkyscraper ()
{
  
  skyscraperWidth = width/2;
  skyscraperHeight = height*0.8;
  skyscraperX = width/2;
  skyscraperY = height/2 + 100;
  
  
  stroke(0);
  strokeWeight(2);
  fill(196, 198, 198);
  rect(skyscraperX, skyscraperY, skyscraperWidth, skyscraperHeight);

}
