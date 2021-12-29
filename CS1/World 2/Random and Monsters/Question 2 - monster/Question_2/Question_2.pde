
final color monsterColor = color(199,119,240);
final color backgroundColor = color(255);
int monsterWidth;
int monsterHeight;
int monsterXCoordinate;
int monsterYCoordinate;


void setup()
{
  size(800,500);  
  background(backgroundColor);
  rectMode(CENTER);
  
  monsterXCoordinate = width/2;
  monsterYCoordinate = height/2;
  monsterWidth = width/6;
  monsterHeight = height/6;

}

void draw()
{

  
  background(backgroundColor);
  drawMonster(monsterXCoordinate, monsterYCoordinate, monsterWidth, monsterHeight, monsterColor);



}


void drawMonster(int monsterHeadX, int monsterHeadY, int monsterHeadWidth, int monsterHeadHeight, color fillColor)
{ 
    
  final int eyeRadius = 5;
 
  fill(fillColor);
  rect(monsterHeadX, monsterHeadY, monsterHeadWidth, monsterHeadHeight);

  // Draw the left ear
  triangle(monsterHeadX - monsterHeadWidth/4, // x1
           monsterHeadY - monsterHeadHeight/2, // y1
           monsterHeadX - monsterHeadWidth/4 - 10, // x2
           monsterHeadY - monsterHeadHeight/2, // y2
           monsterHeadX - monsterHeadWidth/4 - 5, //x3
           monsterHeadY - monsterHeadHeight/2 - 10); //y3
 
  // Draw the right ear
  triangle(monsterHeadX + monsterHeadWidth/4, // x1
           monsterHeadY - monsterHeadHeight/2, // y1
           monsterHeadX + monsterHeadWidth/4 + 10, // x2
           monsterHeadY - monsterHeadHeight/2, // y2
           monsterHeadX + monsterHeadWidth/4 + 5, //x3
           monsterHeadY - monsterHeadHeight/2 - 10); //y3
 
  // Draw the left eye
  ellipse(monsterHeadX - monsterHeadWidth/5,
          monsterHeadY - monsterHeadHeight/4,
          eyeRadius * 2,
          eyeRadius * 2);
 
 // Draw the right eye
 ellipse(monsterHeadX + monsterHeadWidth/5,
         monsterHeadY - monsterHeadHeight/4,
         eyeRadius * 2,
         eyeRadius * 2);
}

void mouseClicked()
{
  monsterXCoordinate = mouseX;
  monsterYCoordinate = mouseY;
}
