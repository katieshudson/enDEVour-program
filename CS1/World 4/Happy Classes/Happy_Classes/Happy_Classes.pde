// declare AND initialize the objects 
Face shockedFace = new Face();
Face happyFace = new Face();
Face sadFace = new Face();

void setup()
{
  background(255);
  size(500, 500);
  
  shockedFace.screenLocationX = width/2;
  shockedFace.screenLocationY = height/2;
  shockedFace.faceSize = 200;
  shockedFace.happinessLevel = 10;
  
  happyFace.screenLocationX = width/4;
  happyFace.screenLocationY = height/2;
  happyFace.faceSize = 100;
  happyFace.happinessLevel = 5;
  
  sadFace.screenLocationX = width*3/4;
  sadFace.screenLocationY = height/2;
  sadFace.faceSize = 75;
  sadFace.happinessLevel = -1;
   
}

void draw()
{
 drawFace(shockedFace);
 drawFace(happyFace);
 drawFace(sadFace);
}


class Face 
{
  float screenLocationX;
  float screenLocationY;
  int faceSize;
  int happinessLevel;
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
