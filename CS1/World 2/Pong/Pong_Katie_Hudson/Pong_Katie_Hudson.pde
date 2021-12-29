
// x and y coordinates of Ball
float ballX;
float ballY;

// x and y speeds of ball
float xSpeed;
float ySpeed;

// keeping track of players' scores
int currentLeftPlayerScore;
int currentRightPlayerScore;

float currentRightPaddleYPosition;
float currentLeftPaddleYPosition;

final int paddleWidth = 15;
final int paddleHeight = 100;

String up;
String down;



void setup()
{
  size(1200, 700);
  
  currentLeftPlayerScore = 0;
  currentRightPlayerScore = 0;
    
  currentRightPaddleYPosition = height/2;
  currentLeftPaddleYPosition = height/2;
  
  xSpeed = -3;
  ySpeed = 3;
  
  ballX = width/2;
  ballY = height/2;
 
}


void draw()
{
  
  background(0);
  smooth();
  
  drawVerticalLine();
  drawScoreBox(currentLeftPlayerScore, currentRightPlayerScore);
  drawBall(ballX, ballY);
  drawLeftPaddle(currentLeftPaddleYPosition);
  drawRightPaddle(currentRightPaddleYPosition);
  moveBall();
  
}


void drawVerticalLine()
{
  
  final int verticalLineWidth = 5;
  final int verticalLineHeight = height;
  
  rectMode(CENTER);
  fill(237, 237, 237);
  rect(width/2, height/2, verticalLineWidth, verticalLineHeight);

}

void drawScoreBox(int leftPlayerScore, int rightPlayerScore)
{
  
  final float leftScoreXPosition = width/4;
  final float leftScoreYPosition = height/18;
  final float rightScoreXPosition = width*3/4;
  final float rightScoreYPosition = height/18;
  
  final int scoreBoxWidth = 65;
  final int scoreBoxHeight = 45;

  // LEFT player score box
  rectMode(CENTER);
  stroke(255);
  strokeWeight(4);
  noFill();
  rect(leftScoreXPosition, leftScoreYPosition, scoreBoxWidth, scoreBoxHeight);
  
  //draw text for the left scorebox 
  fill(255);
  text(leftPlayerScore, leftScoreXPosition, leftScoreYPosition);
 
  // RIGHT player score box
  rectMode(CENTER);
  stroke(255);
  strokeWeight(4);
  noFill();
  rect(rightScoreXPosition, rightScoreYPosition, scoreBoxWidth, scoreBoxHeight);
  
  //draw text for the right scorebox 
  fill(255);
  text(rightPlayerScore, rightScoreXPosition, rightScoreYPosition);

}


void updateLeftPlayerScore() // reminder: the job of this function is to figure out the score and UPDATE it
{  
  if (ballX > width) //if ball leaves RIGHT side of screen...
  {
    currentLeftPlayerScore = currentLeftPlayerScore + 1; // // increase current LEFT player score by 1
  }
}

void updateRightPlayerScore() // reminder: the job of this function is to figure out the score and UPDATE it
{ 
  if (ballX < 0) //if ball leaves LEFT side of screen, increase RIGHT player's score by 1 
  {
    currentRightPlayerScore = currentRightPlayerScore + 1; // // increase current RIGHT player score by 1
  }
  
}

void drawBall(float insertBallX, float insertBallY)
{
  
  final int ballDiameter = 22;
  
  fill(5, 32, 255);
  stroke(255);
  strokeWeight(1.5);
  ellipse(insertBallX, insertBallY, ballDiameter, ballDiameter);
  
}


void drawLeftPaddle(float insertLeftPaddleY)
{
  
  final float leftPaddleXPosition = 25;
  
  rectMode(CENTER);
  strokeWeight(1);
  stroke(255);
  fill(33, 255,0);
  rect(leftPaddleXPosition, insertLeftPaddleY, paddleWidth, paddleHeight);
  
}


void drawRightPaddle(float insertRightPaddleY)
{
    

  final float rightPaddleXPosition = width-25;
  
  rectMode(CENTER);
  strokeWeight(1);
  stroke(255);
  fill(33, 255,0);
  rect(rightPaddleXPosition, insertRightPaddleY, paddleWidth, paddleHeight);

}


void moveLeftPaddle(String direction)
{

  float moveAmount = 50;
  
  float currentTopOfPaddle = currentLeftPaddleYPosition - paddleHeight/2;
  float projectedTopOfPaddle;
  
  float currentBottomOfPaddle = currentLeftPaddleYPosition + paddleHeight/2;
  float projectedBottomOfPaddle;
  
  
  if (direction == "up")
  {
    moveAmount = moveAmount * (-1);  // make movement negative (to move up)
    projectedTopOfPaddle = currentTopOfPaddle + moveAmount; // let's see where we endup by the amount we want to move
    
      if (projectedTopOfPaddle <= 0) 
      {        
        moveAmount = 0 - currentTopOfPaddle;
        
      }
        
  }
  

  if (direction == "down")
  {
    moveAmount = moveAmount * (1);  // make movement position (to move down)
    projectedBottomOfPaddle = currentBottomOfPaddle + moveAmount;
    println(projectedBottomOfPaddle + " projectedBottomOfPaddle");
    println(currentBottomOfPaddle + " currentBottomOfPaddle");
    println(height + " height");
    
      if (projectedBottomOfPaddle >= height)
      {
        moveAmount = height - currentBottomOfPaddle;
        println(moveAmount + " moveAmount");
      }
    
  
 
  }
 
 currentLeftPaddleYPosition = currentLeftPaddleYPosition + moveAmount;
 println(" ");
}

void moveRightPaddle(String direction)
{
  
  float moveAmount = 50;
  
  float currentTopOfPaddle = currentRightPaddleYPosition - paddleHeight/2;
  float projectedTopOfPaddle;
  
  float currentBottomOfPaddle = currentRightPaddleYPosition + paddleHeight/2;
  float projectedBottomOfPaddle;
  
  if (direction == "up")
  {
    moveAmount = moveAmount * (-1);  // make movement negative (to move up)
    projectedTopOfPaddle = currentTopOfPaddle + moveAmount; // let's see where we endup by the amount we want to move
    
      if (projectedTopOfPaddle <= 0) 
      {        
        moveAmount = 0 - currentTopOfPaddle;
        
      }
        
  }
  

  if (direction == "down")
  {
    moveAmount = moveAmount * (1);  // make movement position (to move down)
    projectedBottomOfPaddle = currentBottomOfPaddle + moveAmount;
    println(projectedBottomOfPaddle + " projectedBottomOfPaddle");
    println(currentBottomOfPaddle + " currentBottomOfPaddle");
    println(height + " height");
    
      if (projectedBottomOfPaddle >= height)
      {
        moveAmount = height - currentBottomOfPaddle;
        println(moveAmount + " moveAmount");
      }
    
  
 
  }
  
   currentRightPaddleYPosition = currentRightPaddleYPosition + moveAmount;
   
}



//void moveBall(float currentX, float currentY, float xSpeed, float ySpeed)
void moveBall()
{
  final float rightPaddleXPosition = width-25;
  final float leftPaddleXPosition = 25;
  
  ballX = ballX + xSpeed;
  ballY = ballY + ySpeed;
  
  
  /* HITTING TOP OR BOTTOM OF SCREEN */
  if (ballY < 0 || ballY > height) // if the ball hits the top or bottom of the screen...
  {
    ySpeed = ySpeed * -1; //change direction of ball (change Y speed)  
  }
    
  /* HITTING LEFT PADDLE */
  if (ballX < (leftPaddleXPosition + paddleWidth/2 + 10) && ballX > (25 - paddleWidth/2))
  {

    if (ballY < currentLeftPaddleYPosition + paddleHeight/2)  // balls Y needs to be between PaddleY + 1/2 height AND PaddleY - 1/2 height
    {
      if (ballY > currentLeftPaddleYPosition - paddleHeight/2)
      {
        xSpeed = xSpeed * -1; // reverse ball direction aka bounce the ball
      }
    }
  }
  
  /* HITTING RIGHT PADDLE */
  if (ballX > (rightPaddleXPosition - paddleWidth/2 - 10))
  {
    
    if( ballX < (width - 25 + paddleWidth/2))
    {
      if (ballY < (currentRightPaddleYPosition + paddleHeight/2))
      {
         
        if (ballY > (currentRightPaddleYPosition - paddleHeight/2))
        {
          xSpeed = xSpeed * -1; // reverse ball direction aka bounce the ball
        }
  
      }
    }
  }
  

  /* PLAYER SCORES - SCORE UPDATED, BALL RESET */
  if (ballX > width) // LEFT PLAYER SCORES --> if the ball leaves the RIGHT side of the screen...
  {
    updateLeftPlayerScore(); // update LEFT player score
    resetBallPosition(); // resets ball to starting position
  }
  
  if (ballX < 0) // RIGHT PLAYER SCORES --> if the ball leaves the LEFT side of the screen...
  {
    updateRightPlayerScore(); // update RIGHT player score
    resetBallPosition(); // resets ball to starting position
  
  }


}

void resetBallPosition()
{
  // starting position of ball 
  ballX = width/2;
  ballY = height/2;
  
  xSpeed = xSpeed * -1;

}


void keyPressed()
{

  switch(key)
    {
      case 'w':
        // move LEFT paddle UP if "w" key is pressed 
        moveLeftPaddle("up");
        break;
      
      case 's':
        // move LEFT paddle DOWN if "s" key is presssed
        moveLeftPaddle("down");
        break;
      
      case 'o':
        // move RIGHT paddle UP if "o" key is pressed 
        moveRightPaddle("up");
        break;
      
      case 'k': 
        // move RIGHT paddle DOWN if "k" key is pressed
        moveRightPaddle("down");
        break;
      
      default:
        print("Please select a valid key. 'w' and 's' are left paddle controls, 'o' and 'k' are right paddle controls");
        break;
    
    }

}
