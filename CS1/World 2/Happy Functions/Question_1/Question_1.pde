void setup()
{
  size(500, 350);
  background(225, 157,255);
  smooth();
}

void draw()
{
  happy();
}

void happy()
{
  
 //Head 
  stroke(0);
  strokeWeight(5);
  fill(255,255,0);
  ellipseMode(CENTER);
  ellipse(width/2,height/2,200,200);
  
  //left eye 
  noStroke();
  fill(0);
  ellipseMode(CENTER);
  ellipse(width*0.44,height*0.4,30,50);
  
  //right eye 
  noStroke();
  fill(0);
  ellipseMode(CENTER);
  ellipse(width*(1-0.44),height*0.4,30,50);
  
  //Smile
  noStroke();
  fill(0);
  arc(width/2,height*3/5,100,100,0,PI);
}
