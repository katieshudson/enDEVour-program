// Question 1: Draw a rectangle in the output window.
// The rectangle should be horizontally centred and occupy almost all of the width (but not all).

size(800,500);
background(50,131,40);

// Width of rectangle relative to size of canvas
//float used to ensure that the width occupies as close to the border as possible without rounding up. 
// Decimals are important here.
float rectWidthX1 = width*0.01;
float rectWidthX2 = width*0.99;

//Height of rectangle relative to size of canvas. Decimals not important here, thus using int
int rectHeightY1 = height/6;
int rectHeightY2 = height/2;

//Corners RectMODE used to control the x,y coordinates close to the borders of the canvas
noStroke();
fill(246,255,3);
rectMode(CORNERS);
rect(rectWidthX1,rectHeightY1,rectWidthX2,rectHeightY2);
