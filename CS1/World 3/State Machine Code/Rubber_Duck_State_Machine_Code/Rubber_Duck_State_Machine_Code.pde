
// states of Duck
int duckState;
final int duckStateClean = 1;
final int duckStateFullDirty = 2;
final int duckStateHalfDirty = 3;

// images used in Program
PImage wateringCanImage;
PImage duckCleanImage;
PImage duckFullDirtyImage;
PImage duckHalfDirtyImage;
PImage muddyPuddleImage;
PImage cleanPuddleImage;

// x and y coordinates of shapes 
int duckXPosition;
int duckYPosition;

int cleanPuddleXPosition;
int cleanPuddleYPosition;

int muddyPuddleXPosition;
int muddyPuddleYPosition;

final float duckShapeThreshold = 100;


// speed and direction variables
float duckCurrentSpeed;
float duckFullSpeed = 4;
float duckDirection = 0;

//width and height variables
int puddleWidth = 200;
int puddleHeight = 100;

int wateringCanWidth = 50;
int wateringCanHeight = 50;

int duckWidth = 150;
int duckHeight = 150;

//mouseClick Count Tracking 
int mouseClickCount = 0;

void setup()
{
  size(800, 500);
  imageMode(CENTER);
  
  duckXPosition = width/4;
  duckYPosition = height/4;
  duckCurrentSpeed = duckFullSpeed;
  
  cleanPuddleXPosition = 150;
  cleanPuddleYPosition = 400;

  muddyPuddleXPosition = 500;
  muddyPuddleYPosition = 200;
  
  //duck images 
  duckCleanImage = loadImage("rubber_duck.png");
  duckCleanImage.resize(duckHeight, duckWidth);
  duckFullDirtyImage = loadImage("full_dirty_rubber_duck.png");
  duckFullDirtyImage.resize(duckHeight, duckWidth);
  duckHalfDirtyImage = loadImage("half_dirty_rubber_duck.png");
  duckHalfDirtyImage.resize(duckHeight, duckWidth);

  //puddle images 
  muddyPuddleImage = loadImage("muddy_puddle.png");
  muddyPuddleImage.resize(puddleWidth, puddleHeight);
  cleanPuddleImage = loadImage("clean_puddle.png");
  cleanPuddleImage.resize(puddleWidth, puddleHeight);
  
  //watering can image 
  wateringCanImage = loadImage("watering_can.png");
  wateringCanImage.resize(wateringCanWidth, wateringCanHeight);
  cursor(wateringCanImage);
  
  duckState = duckStateClean;
  
}

void draw()
{
  
  background(255);
  
  updateDuckState();
  drawMuddyPuddle(muddyPuddleXPosition, muddyPuddleYPosition);
  drawCleanPuddle(cleanPuddleXPosition, cleanPuddleYPosition);
  drawDuck(duckXPosition, duckYPosition);
  
  moveDuck();

}

void updateDuckState()
{

  if (duckState == duckStateClean) // IF DUCK IS CLEAN
    {
      // if duck crosses muddy puddle, then update state to full dirty and reduce speed by half
      if (dist(duckXPosition, duckYPosition, muddyPuddleXPosition, muddyPuddleYPosition) < duckShapeThreshold)
          {
            
            duckState = duckStateFullDirty;
            duckCurrentSpeed = duckFullSpeed/2;
          
          }
    
    } else if (duckState == duckStateFullDirty) // IF DUCK IS FULL DIRTY
         {
         
           //if duck crosses clean puddle, then update state to clean and update speed to full speed
           if (dist(duckXPosition, duckYPosition, cleanPuddleXPosition, cleanPuddleYPosition) < duckShapeThreshold)
               {
                 
                 duckState = duckStateClean;
                 duckCurrentSpeed = duckFullSpeed;
               
               } 
           
         } else if (duckState == duckStateHalfDirty) // IF DUCK IS HALF DIRTY
              {
              
                // if duck crosses clean puddle, then update state to clean and update speed to full speed
                if (dist(duckXPosition, duckYPosition, cleanPuddleXPosition, cleanPuddleYPosition) < duckShapeThreshold)
                    {
                      
                      duckState = duckStateClean;
                      duckCurrentSpeed = duckFullSpeed;
                      
                    } else if (dist(duckXPosition, duckYPosition, muddyPuddleXPosition, muddyPuddleYPosition) < duckShapeThreshold) // if duck crosses muddy puddle, 
                                                                                                                                    // then update state to full dirty 
                                                                                                                                    //and update speed to half of full                         
                        {
  
                          duckState = duckStateFullDirty;
                          duckCurrentSpeed = duckFullSpeed/2;

                        }    
              }
}



void drawDuck(int insertDuckXPosition, int insertDuckYPosition)
{

  if (duckState == duckStateClean)  // if duck is clean
      {
      
        image(duckCleanImage, insertDuckXPosition, insertDuckYPosition); //use Clean Duck image
        
      } else if (duckState == duckStateFullDirty) // if duck is dirty
          {
         
             image(duckFullDirtyImage, insertDuckXPosition, insertDuckYPosition); //use Full Dirty Duck image
            
          } else if (duckState == duckStateHalfDirty) // if duck is half dirty
              {
              
                  image(duckHalfDirtyImage, insertDuckXPosition, insertDuckYPosition); // use Half Dirty Duck Image
                  
              }

}


void drawCleanPuddle(int insertCleanPuddleX, int insertCleanPuddleY)
{
  
  image(cleanPuddleImage, insertCleanPuddleX, insertCleanPuddleY);

}

void drawMuddyPuddle(int insertMuddlePuddleX, int insertMuddlePuddleY)
{

  image(muddyPuddleImage, insertMuddlePuddleX, insertMuddlePuddleY);

}

void moveDuck()
{
  
  // Update the duck's direction
  int nextX = duckXPosition + int(duckCurrentSpeed * cos(duckDirection));
  int nextY = duckYPosition + int(duckCurrentSpeed * sin(duckDirection));

  // Check cross product to determine whether we need to go left or right
  int crossProduct = (nextX - duckXPosition)*(mouseY - duckYPosition) -
                     (nextY - duckYPosition)*(mouseX - duckXPosition);
  
  // update duck's position 
  duckXPosition = nextX;
  duckYPosition = nextY;
  
  // 5% of the time we turn eft or right towards the mouse 
  if (random(1) < 0.05)
  {
    final int angleToTurn = 30;
    if (crossProduct < 0) // turn left (would be right if y was up)
    {
      duckDirection -= radians(angleToTurn 
                                + random(angleToTurn/4) 
                                - angleToTurn/8);
    }
    else // turn right (would be left if y was down)
    {
      duckDirection += radians(angleToTurn 
                                + random(angleToTurn/4) 
                                - angleToTurn/8);
    }
  }
  
}

void mouseClicked()
{
  
  // if duck is half dirty, update state to clean and speed to full speed
  if (duckState == duckStateHalfDirty)
      {
        duckState = duckStateClean;
        duckCurrentSpeed = duckFullSpeed;
      }
      
  // if duck is full dirty, update state to half dirty and speed to 3/4 full speed
  if (duckState == duckStateFullDirty)
      {
        duckState = duckStateHalfDirty;
        duckCurrentSpeed = duckFullSpeed*3/4;
      }

}
