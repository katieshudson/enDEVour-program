
//declaring variables 
float headX;
float headY;
float headDiameter;

void setup()
{
  size(800, 500);
  background(225, 157,255);
  smooth();
}


//Choose your location! Update the x,y coordinates
void draw()
{
     happy(400, 250);
     happy(200, 100);
     happy(600, 100);
     happy(200, 400);
     happy(600, 400);
}


//generalizing happy() function so you can draw it wherever ! 
void happy(float headX, float headY)
{
  float headDiameter = 175; 
  
  //Head 
  stroke(0);
  strokeWeight(4);
  fill(255,255,0);
  ellipseMode(CENTER);
  ellipse(headX, headY, headDiameter, headDiameter);
  
  //left eye 
  noStroke();
  fill(0);
  ellipseMode(CENTER);
  ellipse(headX - headDiameter/5, headY - headDiameter/5, headDiameter/5, headDiameter/5);
  
  //right eye 
  noStroke();
  fill(0);
  ellipseMode(CENTER);
  ellipse(headX + headDiameter/5, headY - headDiameter/5, headDiameter/5, headDiameter/5);
  
  //Smile
  noStroke();
  fill(0);
  arc(headX, headY+headDiameter/6,headDiameter/2,headDiameter/2,0,PI);
  
}
