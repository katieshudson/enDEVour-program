size(1200,600);


//Variable name ratioOfRect defines the ratio of the rectangle to canvas size
//Variable name ratioCenterPoint defines the ratio of the rectangle's center point to the canvas size
float ratioOfRect = (1.0 / 3.0);
float ratioCenterPoint = (1.0 / 2.0);

background(112,72,191);
noStroke();
fill(255,255,0);
rectMode(CENTER);
rect(ratioCenterPoint*width,ratioCenterPoint*height,ratioOfRect*width,ratioOfRect*height);
