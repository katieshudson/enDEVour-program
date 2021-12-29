/* 

Hello and welcome to the Function Refactoring Assignment Question!


---------- PATTERN RECOGNITION IN FILE -------------------

- each circle has the same (x,y) coordinates for the outer, inner and most inner circle. 
- each triple circle shape consists of 3 individual circles (outer circle, inner circle, most inner circle)
- the inner circles are consistently relative to the size of the outer circle (ie. inner circle is half of the outer, then the innermost circle is 1/4 of the outer). 
- instead of calling the ellipse() function 9 times to create the 3 triple circle shapes, you can instead absract it to a function and only call it 3 times.
- each circle follows the same color pattern: outer circle = dark, inner circle = medium, most inner circle = light (either red, blue or green). 
- next there are 3 overall triple circle shape sizes (big, medium and large) - meaning the user can choose how big they want their overall shape to be
- each circle color gradient increases by 30 or 60

----- HOW THE drawOneTripleCircle(); FUNCTION GENERALIZES AND HIDES DETAILS -------

1) Generalize 
- The function generalizes the overall circle size which then determines the actual diameter via variables when the function is called.  
- The function helps to break down the desired shapes + colours into: (x,y) coordinates, overall circle size, and then the colours you're looking for. 
- Example: instead of drawing multiple and specific circles, I have generalized / abstracted this into a function so the user can simply select where they want 
to place the circle at their desired (x,y) coordinate, how big they want the circle (big, medium, small), and what 3 colours they want the circle to have. 
- I have generalized the number of colours down from 9 to 3 choices (red + green + blue). 
- I have also removed the color codes and instead leveraged variable names to more clearly state the name of each color. 
- The new function more clearly states the sizes of each circle instead of circle 1, 2, and 3. Making it easier to scan the code and understand what is happening and where.
- Finally, I've reduced the reptition whe nit comes to the (x,y) coordinates of each circle, since each of the 3 circles within one triple circle are the same. 

2) Hide Details 
- The drawOneTripleCircle() function hides the details of 3 separate ellipse() required to make one triple circle. Reducing the number of ellipse functions from 9 to one overall function.
- The function also hides the color codes of each of the fill(); functions for each of the circles and simplifying the gradients by adding +30 or +60 to the color code
- I've hidden the details of the various diameters of each circle, and instead made them into relative formulas to simplify the code more.


----------EXPLANATION OF drawOneTripleCircle(); FUNCTION ---------------------

=== Location of Circles ===

You as the user have the opportunity to choose where you want the triple circle shape to be placed. 
Simply choose an x and y coordinate to place the circle where you want it to be. 


=== Circle Sizes ===

Each triple circle shape consists of 3 circles (outer, inner, and inner most circle). 
You as the user have a choice to make this overall triple circle shape big, medium or small. 


=== Colours ===

Each triple circle can either be red, blue or green! You choose which color you want for your circle and the gradient will be calculated for you. 

*/


//Choose your color for your circle!
color circleColorRed = color(180, 0, 0);  // baseline color, dark red
color circleColorBlue = color(0, 0, 195); // baseline color, dark blue 
color circleColorGreen = color(50, 50, 0); // baseline color, dark green 


//the user requests how big they'd like their circle. These are variables for the available sizes available.  
int bigCircleRequest = 200;
int mediumCircleRequest = 140;
int smallCircleRequest = 100;
  

void setup()
{
  size(500,500);
}

void draw()
{
  
  background(255);
  
  drawOneTripleCircle(50, 50, smallCircleRequest, circleColorRed);
  drawOneTripleCircle(350, 80, mediumCircleRequest, circleColorBlue);
  drawOneTripleCircle(275, 300, bigCircleRequest, circleColorGreen);

}


void drawOneTripleCircle(int circleX, int circleY, int overallCircleSize, color circleColor)
{
    
  int outerCircleDiameter = overallCircleSize;
  
  //big circle 
  fill(circleColor);
  ellipse(circleX, circleY, outerCircleDiameter, outerCircleDiameter);
  
  //medium circle 
  fill(circleColor+30);
  ellipse(circleX, circleY, outerCircleDiameter/2, outerCircleDiameter/2);
  
  //small circle 
  fill(circleColor+60);
  ellipse(circleX, circleY, outerCircleDiameter/4, outerCircleDiameter/4);

}
