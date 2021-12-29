//Width and Height of Bear + Goldi
  float bearWidth = 75;
  float bearHeight = 100;
  float goldiWidth = 75;
  float goldiHeight = 100;
  

void setup()
{
size (800,500);
background (195,245,206);
smooth();
}


void draw()
{

  float spaceWidth = (width - 3*bearWidth)/4;
  float spaceHeight = (height - goldiHeight - bearHeight)/3;
 
  
  
  // Center Points = x and y coordinate variables for Bear + Goldi when calling each function  
  float leftBearX = spaceWidth + bearWidth/2; 
  float middleBearX = spaceWidth*2 + bearWidth + bearWidth/2;
  float rightBearX = spaceWidth*3 + bearWidth*2 + bearWidth/2;
  float bearY = spaceHeight*2 + goldiHeight + bearHeight/2; 

  float goldiX = width/2;
  float goldiY = spaceHeight + goldiHeight/2;
  
  goldilocks(goldiX, goldiY);
  
  bear(leftBearX, bearY);
  bear(middleBearX, bearY);
  bear(rightBearX, bearY);
  
 
}


//Goldilocks function
void goldilocks(float goldiX, float goldiY)
{

    float goldiHeadX = goldiX;
    float goldiHeadY = goldiY - goldiHeight/3;
    float goldiHeadDiameter = 48;
    float goldiTriangleX1 = goldiX - goldiWidth/2;
    float goldiTriangleX2 = goldiX;
    float goldiTriangleX3 = goldiX + goldiWidth/2; 
    float goldiTriangleY1 = goldiY + goldiHeight/2;
    float goldiTriangleY2 = goldiY - goldiHeight/4;
    float goldiTriangleY3 = goldiY + goldiHeight/2;
  
  
  
//Goldilocks Body
    strokeWeight(2);
    stroke(0);
    fill(234,149,219);
    triangle(goldiTriangleX1, goldiTriangleY1, goldiTriangleX2, goldiTriangleY2, goldiTriangleX3, goldiTriangleY3);
 
 
 //Goldilocks Head
   strokeWeight(2);
   stroke(0);
   fill(247,240,244);
   ellipseMode(CENTER);
   ellipse(goldiHeadX, goldiHeadY, goldiHeadDiameter, goldiHeadDiameter);
}


// Bear Function 
void bear(float bearX, float bearY)
{

 
  float bearBodyX = bearX;
  float bearBodyY = bearY;
  
  float bearHeadX = bearX;
  float bearHeadY = bearY - bearHeight/2 + bearHeight*1/4;
  
  float bearBodyHeight = bearHeight*2/3;
  float bearHeadDiameter = bearHeight*13/36;
  
  float bearLeftEarX = bearX - bearWidth/8;
  float bearLeftEarY = bearHeadY - bearHeadDiameter/2;
  
  float bearRightEarX = bearX + bearWidth/8;
  float bearRightEarY = bearHeadY - bearHeadDiameter/2;

  
  float bearEarDiameter = bearHeadDiameter/3;
  
  
// Body 
    stroke(0);
    strokeWeight(2);
    fill(147,115,52);
    ellipseMode(CENTER);
    ellipse(bearBodyX, bearBodyY + bearHeight*1/6, bearWidth, bearBodyHeight);
 

// Head 
    stroke(0);
    strokeWeight(2);
    fill(147,115,52);
    ellipseMode(CENTER);
    ellipse(bearHeadX, bearHeadY, bearHeadDiameter, bearHeadDiameter);

// Ear - Left 
    stroke(0);
    strokeWeight(2);
    fill(147,115,52);
    ellipseMode(CENTER);
    ellipse(bearLeftEarX, bearLeftEarY, bearEarDiameter, bearEarDiameter);

// Ear - Right 
    stroke(0);
    strokeWeight(2);
    fill(147,115,52);
    ellipseMode(CENTER);
    ellipse(bearRightEarX, bearRightEarY, bearEarDiameter, bearEarDiameter);

}
