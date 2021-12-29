float circleX;
float circleY;

float midPointAnchor;


void setup()
{
  size(800,500);
  background(255);
  
  midPointAnchor = width/2;

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




void determineCircleColor() // using blue quadrants 
{
  
  if ((circleX >= (midPointAnchor - circleY)) && (circleX <= (midPointAnchor + circleY)))
      {
        fill(53, 211, 2); //green
      }
  else
      {
        fill(24, 54, 237); //blue
      }
      
      //if (circleX >= (midPointAnchor - circleY) {
      //  if (circleX <= (midPointAnchor + circleY)) {
      //    //grren
      //  } else {
      //    // blue
      //  }
      //} else {
      //    //blue
      //}
        
  
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
