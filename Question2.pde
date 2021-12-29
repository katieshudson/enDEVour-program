// Basic Drawing Assignment Question 2

size(1200,800);

//Variable ratioCenterX is the position of x coordinate relative to canvas size
//Variable ratioCenterY is the position of the y coordinate relative to canvas size
float ratioCenterX = (2.0 / 3.0);
float ratioCenterY = (1.0 / 4.0);


noStroke();
fill(0);
ellipseMode(CENTER);
ellipse(width*ratioCenterX,height*ratioCenterY,50,50);
