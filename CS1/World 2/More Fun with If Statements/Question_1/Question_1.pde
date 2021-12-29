//location of circle variables
float circleX;
float circleY;
float offset = 30;
float circleDiameter = 50;

//setting maxheight variable to 0
float maxHeight = 0;

//setting countTouchBottom to 0 
int countTouchBottom = 0;

//speed of circle variables
float xSpeed = 0;
float ySpeed = 5;

int heightFactor = 2;

//initial color of circle
color startingCircleColor = color(0,0,180);

//Circle color in every moment
color currentCircleColor = startingCircleColor;

void setup()
{
  size(800,500);
  smooth();  
 
  //starting x,y coordinate position 
  circleX = width/2;
  circleY = offset;
  
}


void draw()
{

  drawCircle(circleX, circleY, currentCircleColor);
  updateParameters();

}

//drawing the circle function
void drawCircle(float inputCircleX, float inputCircleY, color inputCircleColor)
{

  background(200);
  stroke(0);
  strokeWeight(2);
  fill(inputCircleColor);
  ellipseMode(CENTER);
  ellipse(inputCircleX, inputCircleY, circleDiameter, circleDiameter);
  
}
  
//function to handle all of the changes and limitations to my circle  
void updateParameters()  
{
  
  //moving the circleY formula
  circleY = circleY + ySpeed;
  
  //adjusting the color every frame by 1 pixel 
  currentCircleColor = currentCircleColor + 1;
  
  //setting boundaries for the circle's movement
  if ((circleY + circleDiameter/2) > height)
    {
    ySpeed = ySpeed * -1;
    countTouchBottom = countTouchBottom +1;
    
    //if the circle touches the bottom 2 or more times and the maxHeight does 
    //not equal the height of the canvas minus the diameter of the circle, 
    //then change the maxHeight by the heightFactor each time the circle is drawn
    if (countTouchBottom >= 2 && !(maxHeight >= (height - circleDiameter)))
      {
        print("heightFactor is " + heightFactor + "\n");
        maxHeight = maxHeight + (height/(heightFactor));
        heightFactor = heightFactor * 2;
      }
    
    //if the maxHeight is greater than the height of the canvas minus the circleDiameter
    //then set the maxHeight to the height of the canvas, give a new y coordinate to circleY
    //and set the yspeed to 0 to stop the ball
    if (maxHeight > (height - circleDiameter))
      {
        maxHeight = height - circleDiameter;
        ySpeed = 0;
        circleY = height - circleDiameter/2;
      }
    }
    
   // if the Y position of the circle is less than the maxHeight 
   if (circleY < maxHeight + circleDiameter/2)
     {
       ySpeed = ySpeed * -1;
     }

    }
  
