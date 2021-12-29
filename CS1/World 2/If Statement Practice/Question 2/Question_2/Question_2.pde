void setup() 
{
  size(800,500);
}

void draw() 
{
  
  //variables for my rectangle 
  float rectX = width/2;
  float rectY = height/2;
  float rectWidth = width/3;
  float rectHeight = height/3;
  
  //drawing the basic rectangle
  noStroke();
  rectMode(CENTER);
  rect(rectX, rectY, rectWidth, rectHeight);
  
 /*
 My if statements for the mouse position are listed below. 
 the mouse x and y coordinate need to fill within the rectangle's area 
 in order to do that, we need an if statement where all statements need to be true
 thus, I leverage the AND (&&) logical operator
 */

  if   (mouseX <= rectX + (rectWidth/2) && 
        mouseX >= rectX - (rectWidth/2) &&
        mouseY <= rectY + (rectHeight/2) &&
        mouseY >= rectY - (rectHeight/2))
  {
   //if the mouse x,y coordinates appear within the rect
   // background is yellow, and fill is purple
    background(245,238,17);
    fill(111,17,245);
  }
   else 
   {
    // if the mouse x,y coordinate do not appear within the rect
    // background is purple and fill is yellow
    background(111,17,245);
    fill(245,238,17); 
   }
       
  rect(rectX, rectY, rectWidth, rectHeight);

}
