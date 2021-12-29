final int robotSpeed = 3;
final int robotMouseThreshold = 50;

int robot1X;
int robot1Y;
float robot1Direction; // in radians
int robot1TimeOfBeacon = -1;

int robot2X;
int robot2Y;
float robot2Direction; // in radians
int robot2TimeOfBeacon = -1;  // last time the robot touched the beacon

int robotDiameter = 20;

int beaconX;
int beaconY;
int beaconDiameter = 30;
boolean beaconDragged = false;

color robotFillColor1 = color(191, 189, 234);
color robotFillColor2 = color(234, 189, 234);

void setup()
{
  size(500, 500); 

  // starting x and y locations of robot1, robot2 and the beacon 
  robot1X = 50;
  robot1Y = 50;
  robot1Direction = 0;

  robot2X = 250;
  robot2Y = 250;
  robot2Direction = 0;

  beaconX = 150;
  beaconY = 150;
}


void draw()
{
  background(255);

  drawRobot(robot1X, robot1Y, robot1Direction, robotDiameter, robotFillColor1);
  drawRobot(robot2X, robot2Y, robot2Direction, robotDiameter, robotFillColor2);

  drawBeacon();

  if (robot1TimeOfBeacon < 0 || millis() - robot1TimeOfBeacon > 3000)
    moveRobot1();

  if (robot2TimeOfBeacon < 0 || millis() - robot2TimeOfBeacon > 3000)
    moveRobot2();
}


void drawRobot(int insertRobotX, int insertRobotY, float insertRobotDirection, int insertRobotDiameter, color robotColor)
{

  stroke(0);
  strokeWeight(2);
  fill(robotColor);
  ellipseMode(CENTER);
  ellipse(insertRobotX, insertRobotY, insertRobotDiameter, insertRobotDiameter); 
  line(insertRobotX, // starting point of line, mid point of circle, x coordinate
    insertRobotY, // starting point of line, mid point of circle, y coordinate
    insertRobotX + (insertRobotDiameter/2 * cos(insertRobotDirection)), // ending point of line, edge of circle, x coordinate
    insertRobotY + (insertRobotDiameter/2 * sin(insertRobotDirection))); // ending point of line, edge of circle, y coordinate
}



void drawBeacon()
{

  stroke(0);
  strokeWeight(2);
  fill(247, 247, 115);
  ellipseMode(CENTER);
  ellipse(beaconX, beaconY, beaconDiameter, beaconDiameter);
}


void moveRobot1()
{

  // if robot is within a threshold of the beacon, stop moving the robot, robot1timeofbeacon would be = to millis()

  int nextX = robot1X + int(robotSpeed * cos(robot1Direction));
  int nextY = robot1Y + int(robotSpeed * sin(robot1Direction));

  int crossProduct = getCrossProduct(nextX, nextY, robot1X, robot1Y);

  robot1Direction += getAngleToTurn(crossProduct);

  if (dist(nextX, nextY, beaconX, beaconY) > 25)  // is the robot within the threashold of the beacon? 
  {
    robot1X = nextX;
    robot1Y = nextY;      
    
  } else {
    
    robot1TimeOfBeacon = millis(); // resets as the last time the robot was touching the beacon, and set it to the current time.
  
  }

}

void moveRobot2()
{

  int nextX = robot2X + int(robotSpeed * cos(robot2Direction));
  int nextY = robot2Y + int(robotSpeed * sin(robot2Direction));

  int crossProduct = getCrossProduct(nextX, nextY, robot2X, robot2Y);

  robot2Direction += getAngleToTurn(crossProduct);
  
  if (dist(nextX, nextY, beaconX, beaconY) > 25)  // is the robot within the threashold of the beacon? 
  {
    robot2X = nextX;
    robot2Y = nextY;
  
  } else {
  
    robot2TimeOfBeacon = millis(); // resets as the last time the robot was touching the beacon, and set it to the current time.
  
  }

}

int getCrossProduct(int nextX, int nextY, int robotX, int robotY)   // Cross product function
{
  return (nextX - robotX)*(beaconY - robotY) -
    (nextY - robotY)*(beaconX - robotX);
}


float getAngleToTurn(int crossProduct)  // determining the angle to turn function , the direction?? 
{
  final int angleToTurn = 30;
  if (random(1) < 0.05)
  {
    float angleToTurnWithRandomness = 
      radians(angleToTurn + random(angleToTurn/4.0f)  - angleToTurn/8.0f);

    if (crossProduct < 0)
    {
      return -angleToTurnWithRandomness;
    } else
    {
      return angleToTurnWithRandomness;
    }
  }
  return 0;
}

void mousePressed()
{


  if (dist(beaconX, beaconY, mouseX, mouseY) < beaconDiameter/2)   // is the mouse within the circle? 
  {

    cursor(HAND); // if the mouse is inside the circle then change the cursor
    fill(207, 149, 216);  // purple
    beaconDragged = true;
  } else 
  {
    cursor(ARROW);
  }
}

void mouseDragged()
{

  if (beaconDragged == true)  // if the beacon is being dragged, then the x, y of beacon are the same as the mouse x and y
  {
    fill(207, 149, 216);
    beaconX = mouseX;
    beaconY = mouseY;
  }
}

void mouseReleased() 
{

  beaconDragged = false;
  fill(247, 247, 115);
} 
