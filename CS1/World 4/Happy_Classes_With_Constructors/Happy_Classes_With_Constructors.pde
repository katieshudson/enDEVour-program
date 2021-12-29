class Face 
{
  float screenLocationX;
  float screenLocationY;
  int faceSize;
  int happinessLevel;
  
  // screen location, size, happiness value
  Face(float screenLocationX, float screenLocationY, int faceSize, int happinessLevel)
  {
    this.screenLocationX = screenLocationX;
    this.screenLocationY = screenLocationY;
    this.faceSize = faceSize;
    this.happinessLevel = happinessLevel;
  }
  
}

void setup()
{
  background(255);
  size(500, 500);
  
  // declare and initialiez objects with constructors 
  Face shockedFace = new Face(width/2, height/2, 200, 10);
  Face happyFace = new Face(width/4, height/2, 100, 5);
  Face sadFace = new Face(width*3/4, height/2, 75, -1);
     
  drawFace(shockedFace);
  drawFace(happyFace);
  drawFace(sadFace);
}

void drawFace(Face kindOfFace)
{
  
  //Head 
  stroke(0);
  strokeWeight(4);
  fill(255,255,0);
  ellipseMode(CENTER);
  ellipse(kindOfFace.screenLocationX, kindOfFace.screenLocationY, kindOfFace.faceSize, kindOfFace.faceSize);
  
  //left eye 
  noStroke();
  fill(0);
  ellipseMode(CENTER);
  ellipse(kindOfFace.screenLocationX - kindOfFace.faceSize/5, 
          kindOfFace.screenLocationY - kindOfFace.faceSize/5, 
          kindOfFace.faceSize/5, 
          kindOfFace.faceSize/5); 
  
  //right eye 
  noStroke();
  fill(0);
  ellipseMode(CENTER);
  ellipse(kindOfFace.screenLocationX + kindOfFace.faceSize/5, 
          kindOfFace.screenLocationY - kindOfFace.faceSize/5, 
          kindOfFace.faceSize/5, 
          kindOfFace.faceSize/5);
  
  //Smile
  noStroke();
  fill(0);
      
  if (kindOfFace.happinessLevel == 10) // very happy
  {
      arc(kindOfFace.screenLocationX, 
      kindOfFace.screenLocationY + kindOfFace.faceSize/6,
      kindOfFace.faceSize/2,
      kindOfFace.faceSize/2, 
      0, TWO_PI);
    
  } else if (kindOfFace.happinessLevel == 5) // medium happy 
    {
      
      arc(kindOfFace.screenLocationX, 
      kindOfFace.screenLocationY + kindOfFace.faceSize/6,
      kindOfFace.faceSize/2,
      kindOfFace.faceSize/2, 
      0, PI);
      
    } else if (kindOfFace.happinessLevel == -1)  // sad
      {
        arc(kindOfFace.screenLocationX, 
        kindOfFace.screenLocationY + kindOfFace.faceSize/6,
        kindOfFace.faceSize/2,
        kindOfFace.faceSize/2, 
        PI, TWO_PI);   
      }
  
}
