// Question 2: Draw three rectangles in the output window lined up horizontally.
// There should not be any overlapping or touching of the rectangles.
// They should almost span the entire width of the output window. 
// It should not matter how big your window is

size(800,500);
background(50,131,40);

//Distance between Rectangles 
float distanceRect = width*1/4*0.1;

//Width of Rectangles 
float widthRect = width*0.3;

//Rectangle One X Variables
float rectOneX1 = distanceRect;
float rectOneX2 = width*0.30 + distanceRect;

//Rectangle Two X Variables 
float rectTwoX1 = rectOneX2 + distanceRect;
float rectTwoX2 = rectTwoX1 + widthRect;

//Rectangle Three X Variables
float rectThreeX1 = rectTwoX2 + distanceRect;
float rectThreeX2 = rectThreeX1 + widthRect;

//All Rectangle Y coordinates 
float rectAllY1 = height*1/5;
float rectAllY2 = height*3/5;


noStroke();
fill(246,255,3);
rectMode(CORNERS);

//Rectangle 1
rect(rectOneX1, rectAllY1, rectOneX2, rectAllY2);

//Rectangle 2 
rect(rectTwoX1, rectAllY1, rectTwoX2, rectAllY2);

//Rectangle 3
rect(rectThreeX1, rectAllY1, rectThreeX2, rectAllY2);
