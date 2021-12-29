float circleX;
float circleY;

float pointX1;
float pointY1;
float pointX2;
float pointY2;


void setup()
{
  size(800,500);
  background(255);
  
  circleX = random(0, width);
  circleY = random(0, height);
  
  pointX1 = width*3/7;
  pointY1 = height*2/5;
    
  pointX2 = width*4/7;
  pointY2 = height*3/5;

}

void draw()
{
  determineRandomCoordinate();
  determineCircleColor();
  drawCircle();

}

//function for determining random x and y coordinates of circles
void determineRandomCoordinate()
{
  //determine random x coordinate
  circleX = random(0, width);
  //print("circleX is " + circleX + "\n");
  
  //determine random y coordinate
  circleY = random(0, height);
  //print("circleY is " + circleY + "\n");
  
}


//function for focusing on the blue quadrants with my if statements
void determineCircleColor() // using blue quadrants 
{
  
  //quadrant top-left
  if ((circleX < pointX1) && (circleY < pointY1))
    {
      println("TOP LEFT");
      fill(24, 54, 237);
    }
   else 
     if ((circleX > pointX2) && (circleY < pointY1)) // quadrant top-right
      {
        println("TOP RIGHT");
        fill(24, 54, 237);
      }
      else
        if ((circleX > pointX2) && (circleY > pointY2)) //quadrant bottom-right  
    {
      fill(24, 54, 237);
    }
  else if ((circleX < pointX1) && (circleY > pointY2)) //quadrant bottom-left
  {
    fill(24, 54, 237);
  }
  else 
  {
    print("ELSE");
    fill(53, 211, 2);
  }
  
}

void drawCircle()
{
  float circleDiameter = 40;
  
  noStroke();
  ellipseMode(CENTER);
  ellipse(circleX, circleY, circleDiameter, circleDiameter);

}


/* alternative function, focusing on the green cross section 

void determineCircleColorAlternative() //using green cross
{
  
  if ((circleX > pointX1) && (circleX < pointX2))
  {
    fill(53, 211, 2); //green
  }
  else if ((circleY > pointY1) && (circleY < pointY2))
  {
   fill(53, 211, 2); // green
  }
  else
  {
    fill(24, 54, 237); //blue
  }
}


*/
