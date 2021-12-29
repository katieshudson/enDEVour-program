
void setup()
{
  size(600, 600);
  background(250,255,3);
  rectMode(CENTER);

}

void draw()
{
  
  float spaceBetween = 2;
  float rectWidth = (width/2) - 1.5*spaceBetween;
  float rectHeight = (height/2) - 1.5*spaceBetween;
  
  float rectX1 = (rectWidth/2) + spaceBetween;
  float rectY1 = (rectHeight/2) + spaceBetween;
  float rectX2 = rectWidth + (rectWidth/2) + 2*spaceBetween;
  float rectY2 = rectY1;
  float rectX3 = rectX1;
  float rectY3 = rectHeight + (rectHeight/2) + 2*spaceBetween;
  float rectX4 = rectX2;
  float rectY4 = rectY3;
  
  
  //Square 1 - red, row 1, left square 
  
  noStroke();
  fill(255, 0, 0);
  rect(rectX1, rectY1, rectWidth, rectHeight);
  
  
  //Square 2 - black, row 1, right square 
  noStroke();
  fill(0);
  rect(rectX2, rectY2, rectWidth, rectHeight);
  
  
  //Spquare 3 - black, row 2, left square 
  noStroke();
  fill(0);
  rect(rectX3, rectY3, rectWidth, rectHeight);
  
  
  //Square 4 - red, row 2, right square 
  noStroke();
  fill(255, 0, 0);
  rect(rectX4, rectY4, rectWidth, rectHeight);  
  

}
