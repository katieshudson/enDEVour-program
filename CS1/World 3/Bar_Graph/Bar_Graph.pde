
size(800,300);
background(255);

final int numPoints = 20; // number of months for total sales data
final int axisX = 20;
final int axisY = height-20;
final int constantY = height-20; // constant Y variable, represents Y coordinate of bottom of bar graph to touch the x axis 

int[] points = new int[numPoints]; // declare the array

float spacing = (width/1.1 - 2*axisX)/numPoints;

int pointNum = 0;
while(pointNum < numPoints)
{
  points[pointNum] = (int)random(height-axisY, axisY); // assign random values to aray slots
  pointNum++;
}

line(axisX, axisY, axisX, height-axisY); // y-axis for graph
line(axisX, axisY, width-axisX, axisY); // x-axis for graph

stroke(0); // outline for bar graph

float previousPointX = axisX;

pointNum = 0;
while (pointNum < numPoints)
{
  
  rectMode(CORNERS);
  fill(20, 255, 0); // fill color for bar graph, green for moneyyyy aka sales
  rect(previousPointX, points[pointNum], previousPointX + spacing, constantY); 
  
  previousPointX = previousPointX + spacing*1.1;
  pointNum++;
  
}
