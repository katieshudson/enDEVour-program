//variables for x and y coordinates of circles
float circleX1;
float circleY1;

float circleX2;
float circleY2;

float circleX3;
float circleY3;


//variables for x and y coordinates of triangle
float triangleX1;
float triangleX2;
float triangleX3;
float triangleY1;
float triangleY2;
float triangleY3;

//seting mouseClickCount to 0
int mouseClickCount = 0; 


void setup()
{
  size(800,500);
  smooth();  
  background(119, 35, 193);

}


void draw()
{}

//drawing the circle function
void drawCircle(float circleX, float circleY)
{
  
  float circleDiameter = 15;
  
  //drawing the circle
  noStroke();
  fill(239, 255, 23);
  ellipseMode(CENTER);
  ellipse(circleX, circleY, circleDiameter, circleDiameter);

}

//drawing the triangle function
void drawTriangle(float triangleX1, float triangleY1, float triangleX2, float triangleY2, float triangleX3, float triangleY3)
{
  //drawing the triangle
  stroke(0);
  strokeWeight(2);
  fill(7, 227, 5);
  triangle(triangleX1, triangleY1, triangleX2, triangleY2, triangleX3, triangleY3);
  
}

//functions and if statements depending on the number of mouse clicks
void mouseClicked()
{
  
  //everytime mouse is clicked, increase mouseClickCount by 1
  mouseClickCount = mouseClickCount + 1;
  println("the mouseClickCount is " + mouseClickCount + "\n");

  if (mouseClickCount == 1)  // state 1
    {
    //1st click = point1 
    drawCircle(mouseX, mouseY);
    circleX1 = mouseX;
    circleY1 = mouseY;
    }
  
  if (mouseClickCount == 2)  // state 2 
    {
      //2nd click = point2
      drawCircle(mouseX, mouseY);
      circleX2 = mouseX;
      circleY2 = mouseY;
    }
  
  /* if the mouse has been clicked 3 times...
      1) draw last circle
      2) draw a triangle using the x,y points of each circle
      3) reset the mouseClickCount to 0
  */
  
  if (mouseClickCount == 3)  // state 3
    {
      //3rd click = point3 
      drawCircle(mouseX, mouseY);
      circleX3 = mouseX;
      circleY3 = mouseY;
      
      drawTriangle(circleX1, circleY1, circleX2, circleY2, circleX3, circleY3);
      println("drawTriangle function");
      
      mouseClickCount = 0;
    }

}



  
