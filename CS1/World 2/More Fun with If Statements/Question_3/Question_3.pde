final int circleSize = 100;
int circleX;
int circleY;
PImage logo;

void setup()
{
  size(500, 400);
  smooth();

  ellipseMode(CENTER);
  imageMode(CENTER);

  circleX = width/2;
  circleY = height/2;

  logo = loadImage("shopify_glyph.png");
  logo.resize((int)(0.6*circleSize), 0);
}

void draw()
{
  drawCircle();
  dragCircle();
  checkBoundaries();

}

//function to draw the circle with the logo of Shopify
void drawCircle()

{
  background(240);
  
  noStroke();
  ellipse(circleX, circleY, circleSize, circleSize);
  
  image(logo, circleX, circleY);

}


//conditional statements to drag the circle with mouse
void dragCircle()
{

  if(dist(circleX, circleY, mouseX, mouseY) < circleSize/2) {// is the mouse inside the circle?
    fill(64, 256, 64); //if mouse is inside the circle, then chnage color 
    cursor(HAND);  //if mouse is inside the circle then change the cursor 
    if(mousePressed){ //when the mouse is pressed, the circle will be drawn where the mouse goes 
      circleX = mouseX;
      circleY = mouseY;
    }
  } else {
    fill(128);
    cursor(ARROW);
  }

}

//function to check boundaries of circle 
//if circle leaves the boundaries it will reset and move back to the center of the canvas
void checkBoundaries()
{
 
  
  if ((circleX < 0 + circleSize/4) || (circleX > width - circleSize/4)) { // check x boundary, if exceeds bring back to center
        circleX = width/2;
        circleY = height/2;
  }
      else if ((circleY < 0 + circleSize/4) || (circleY > height - circleSize/4)) { // check y boundary, if exceeds bring back to center
        circleX = width/2;
        circleY = height/2;   
      }
      else {
        drawCircle();
      }
  }
