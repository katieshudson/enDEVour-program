final int numBricks = 80;

int brickWidth, brickHeight;

int[] brickX = new int[numBricks];
int[] brickY = new int[numBricks];

boolean[] brickHit = new boolean[numBricks];

color[] brickColor = new color[numBricks];
final color YELLOW = #E0F00F;
final color GREEN = #20F00F;
final color ORANGE = #F0A90F;
final color RED = #F03F0F;

float ballX, ballY;
float ballVelocityX, ballVelocityY;
final int ballRadius = 10;

int paddleX, paddleY;
final int paddleWidth = 100, paddleHeight = 5;

int currentScore = 0;
int livesRemaining = 3;
int totalHits = 0; // variable for tracking # of hits for speed intervals
int totalBricksDestroyed = 0;
int startingBallVelocityX = 2;
int startingBallVelocityY = 2;

boolean gameOver = false;


void setup()
{
  size(800, 800);
  rectMode(CENTER);

  paddleX = width/2;
  paddleY = height - paddleHeight - 50;
  
  ballX = paddleX;
  ballY = paddleY - 8;
  
  ballVelocityX = 2;
  ballVelocityY = -2;

  brickWidth = width/10;
  brickHeight = height/(3*8);


  int brickCounter = 0;
  while (brickCounter < numBricks)
  {
    brickX[brickCounter] = (brickCounter % 10)*brickWidth + brickWidth/2;
    brickY[brickCounter] = (brickCounter/10)*brickHeight + brickHeight/2;
    brickHit[brickCounter] = false;
    
    if (brickCounter < 20)
    {
      brickColor[brickCounter] = RED;
    }
      else if (brickCounter < 40)
      {
        brickColor[brickCounter] = ORANGE;
      }
        else if (brickCounter < 60)
        {
          brickColor[brickCounter] = GREEN;
        }
    else
    {
      brickColor[brickCounter] = YELLOW;
    }
    
    brickCounter++;
  }
}


void draw()
{
  
  if (gameOver == false)
  {
  
      background(0);
      smooth();
    
      for (int brickCounter = 0; brickCounter < numBricks; brickCounter++)
      {
        if (brickHit[brickCounter] == false) // draw bricks that have not been hit
        {
          drawBrick(brickX[brickCounter], brickY[brickCounter], brickColor[brickCounter]);
        }
        
      }
      
      drawPaddle(paddleX, paddleY);
      drawBall(ballX, ballY);
      drawScoreBox(currentScore);
      drawLivesRemaining(livesRemaining);
      updateBallPosition();
      checkBallBrickTouchPoints();
      updateLivesRemaining();
      checkGameOver();

  }
}


void drawBrick(float x, float y, color c)
{
  fill(c);
  stroke(0);
  strokeWeight(1);
  rect(x, y, brickWidth, brickHeight);
}


void drawPaddle(float x, float y)
{
  fill(250);
  rect(x, y, paddleWidth, paddleHeight);
}


void drawBall(float x, float y)
{
  
  fill(255);
  ellipseMode(CENTER);
  ellipse(x, y, ballRadius, ballRadius);

}

void drawScoreBox(int score)
{
  float scoreRectX = width - (width/16);
  float scoreRectY = height - 20;
  
  final int scoreBoxWidth = 85;
  final int scoreBoxHeight = 25;
  
  // rect shape for score box
  rectMode(CENTER);
  stroke(255);
  strokeWeight(2);
  noFill();
  rect(scoreRectX, scoreRectY, scoreBoxWidth, scoreBoxHeight);
  
  //draw score text for the scorebox 
  fill(255);
  textSize(12);
  text("Score: " + score, scoreRectX - 35, scoreRectY + 5);

}

void drawLivesRemaining(int lives)
{
  
  float scoreRectX = width/16;
  float scoreRectY = height - 20;
  
  final int scoreBoxWidth = 85;
  final int scoreBoxHeight = 25;
  
  // rect shape for number of lives remaining box
  rectMode(CENTER);
  stroke(255);
  strokeWeight(2);
  noFill();
  rect(scoreRectX, scoreRectY, scoreBoxWidth, scoreBoxHeight);
  
  //draw text for number of lives remaining 
  fill(255);
  textSize(12);
  text("Lives: " + lives, scoreRectX - 35, scoreRectY + 5);
  
}

void drawGameOverBox()
{
  float gameOverXPosition = width/2;
  float gameOverYPosition = height/2;
  
  int gameOverBoxWidth = width*5/6;
  int gameOverBoxHeight = height/4;
  
  fill(250, 0, 4); 
  rect(gameOverXPosition, gameOverYPosition, gameOverBoxWidth, gameOverBoxHeight);
  
  fill(255);
  textSize(80);
  textAlign(CENTER);
  text("GAME OVER", gameOverXPosition, gameOverYPosition + 35);
  
  fill(0);
  textSize(15);
  text("( You lose, try again? )", gameOverXPosition, gameOverYPosition + 75);

}

void checkGameOver()
{
  
  if (livesRemaining == 0)
  {
    gameOver = true;
    drawGameOverBox();
    currentScore = 0; // reset score
    livesRemaining = 3; // reset lives remaining
    ballVelocityX = 2;
    ballVelocityY = -2;
    totalHits = 0;
    
  }

}


void updateLivesRemaining()
{
  if (ballY >= height)
  {    
    livesRemaining = livesRemaining - 1;
    totalHits = 0;
  } 
  
 
}

void updateScore(int insertBrickNum)
{
  
     if (insertBrickNum < 20) // RED, 7pts
      {
        //scoreTracking[brickCounter] = 7;
        currentScore += 7;
        println("ENTERS HERE - RED - " + "current score is " + currentScore); 
      }
        else if (insertBrickNum < 40) // ORANGE, 5pts
        {
          //scoreTracking[brickCounter] = 5;
          currentScore += 5;
          println("ENTERS HERE - ORANGE - " + "current score is " + currentScore); 
        }
          else if (insertBrickNum < 60) // GREEN, 3 pts
          {

            //scoreTracking[brickCounter] = 3;
            currentScore += 3;
            println("ENTERS HERE - GREEN - " + "current score is " + currentScore); 
          
          }
            else // YELLOW, 1 pt
            {
              //scoreTracking[brickCounter] = 1;
              currentScore += 1;
              println("ENTERS HERE - YELLOW - " + "current score is " + currentScore); 
            }
   
}

void updateBallPosition() //move ball
{
 
  /* BOTTOM OF SCREEN */
  if (ballY >= height) // paddle misses ball at bottom
  {
    ballX = paddleX; // reset ballX to starting position. 
    ballY = paddleY - 8; // reset ballY to starting position
    ballVelocityY = -2; // reset velocity Y so mall moves upwards
    ballVelocityX = 2;
    
  } else if (ballX >= width) // Right Wall
    {
      sideBallBounce();
      
    } else if (ballX < 0) /* LEFT WALL */ 
      {
        sideBallBounce();
        
      } else if (ballY < 0) /* TOP OF SCREEN */
        {
          verticalBallBounce(false);
          
        } else if(((ballY + ballRadius/2) >= (paddleY - 8)) && ((ballX > (paddleX - paddleWidth/2)) && (ballX < paddleX + paddleWidth/2))) /* PADDLE */
          {
            verticalBallBounce(true);
            
          } else {
              ballX += ballVelocityX;
              ballY += ballVelocityY;
            }
      
}

void sideBallBounce()
{

  ballX -= ballVelocityX;
  
  ballVelocityX = ballVelocityX * (-1);
}


void verticalBallBounce(boolean bottom)
{
  
  if(bottom)
  {
    ballVelocityY = (-1) * (abs(ballVelocityY));
    
  } else {
    
    ballVelocityY = (abs(ballVelocityY));
  }
  
  ballY += ballVelocityY;
  ballX += ballVelocityX;
}

void updateSpeedIntervals4and12()
{
  
  //after 4 or 12 hits on the bricks, increase speed
  if (totalHits == 4 || totalHits == 12)
  {
    
    if (ballVelocityX > 0) // if ballVelocityX is positive
    {
      ballVelocityX += 1;
      
    } else {  // if negative
      
      ballVelocityX -= 1;
    }
        
    if (ballVelocityY > 0) // if ballVelocityY is positive
    {
      
      ballVelocityY += 1;
      
    } else { // if negative
    
      ballVelocityY -= 1;
    }
    
  }
  
}
  

void updateSpeedIntervalRedAndOrange(int insertBrickCounter)
{

  boolean haveIHitRed = false;
  boolean haveIHitOrange = false;
     
  for (int brickCount = 0; brickCount < numBricks; brickCount++) // increase speed when ball hits RED row of bricks
  {
     
      if (insertBrickCounter < 20 && haveIHitRed == false) // RED bricks
        {
          
            if (ballVelocityX > 0) // if ballVelocityX is positive
            {
              ballVelocityX += 1;
              haveIHitRed = true;
              
            } else if (ballVelocityX < 0)  // if negative 
              {         
                ballVelocityX -= 1;
                haveIHitRed = true;
              }
              
           if (ballVelocityY > 0) // if ballVelocityY is positive
           {
             ballVelocityY += 1;
             haveIHitRed = true;
    
           } else // if negative
             {
               ballVelocityY -= 1;
               haveIHitRed = true;
             }
        
        }
        
      if (insertBrickCounter > 20 && insertBrickCounter < 40 && haveIHitOrange == false) //  increase speed when ball hits ORANGE row of bricks
          {
            if (ballVelocityX > 0) // if ballVelocityX is positive
            {
              ballVelocityX += 1;
              haveIHitOrange = true;
            
            } else  // if negative 
                {         
                  ballVelocityX -= 1;
                  haveIHitOrange = true;
                }
         
           if (ballVelocityY > 0) // if ballVelocityY is positive
           {
             ballVelocityY += 1;
             haveIHitOrange = true;
    
           } else // if negative
             {
               ballVelocityY -= 1;
               haveIHitOrange = true;
           }        
        
        }
    }   

}

void checkBallBrickTouchPoints()
{
  
  // if ball touches the brick top, bottom or sides, then set brickHit to true
   
  for (int brickCounter = 0; brickCounter < numBricks; brickCounter++)
  {
    
    // brick top edge variables
    float brickTopEdgeY = brickY[brickCounter] - brickHeight/2;
    float brickTopEdgeX1 = brickX[brickCounter] - brickWidth/2;
    float brickTopEdgeX2 = brickX[brickCounter] + brickWidth/2;
    
    // brick left edge variables
    float brickLeftEdgeY1 = brickY[brickCounter] + brickHeight/2;
    float brickLeftEdgeY2 = brickY[brickCounter] - brickHeight/2;
    float brickLeftEdgeX = brickX[brickCounter] - brickWidth/2;
    
    // brick right edge variables
    float brickRightEdgeY1 = brickY[brickCounter] + brickHeight/2;
    float brickRightEdgeY2 = brickY[brickCounter] - brickHeight/2;
    float brickRightEdgeX = brickX[brickCounter] + brickWidth/2;
    
    // brick bottom edge variables
    float brickBottomEdgeY = brickY[brickCounter] + brickHeight/2;
    float brickBottomEdgeX1 = brickX[brickCounter] - brickWidth/2;
    float brickBottomEdgeX2 = brickX[brickCounter] + brickWidth/2;
    
    if (brickHit[brickCounter] == false) // check that brick has NOT yet been hit. 
    {
      if ((((ballX - ballRadius/2) <= brickTopEdgeX2) && ((ballX + ballRadius/2) >= brickTopEdgeX1)) &&
              (ballY + (ballRadius/2) >= brickTopEdgeY) && (ballY - ballRadius/2) <= brickTopEdgeY) // TOP EDGE
      {
        brickHit[brickCounter] = true;
        ballVelocityY = ballVelocityY*(-1); // bounce ball (aka change direction of ballY)
        updateSpeedIntervals4and12();
        updateSpeedIntervalRedAndOrange(brickCounter);
        updateScore(brickCounter);
        totalBricksDestroyed++;
        totalHits++;
        
      } else if (((ballX + ballRadius/2) >= brickLeftEdgeX) && ((ballX - ballRadius/2) <= brickLeftEdgeX) && 
                ((ballY - ballRadius/2 <= brickLeftEdgeY1) && (ballY + ballRadius/2 >= brickLeftEdgeY2)))  // LEFT EDGE
        {
          brickHit[brickCounter] = true;
          ballVelocityX = ballVelocityX*(-1); // bounce ball (aka change direction of ballX)
          updateSpeedIntervals4and12();
          updateSpeedIntervalRedAndOrange(brickCounter);
          updateScore(brickCounter);
          totalBricksDestroyed++;
          totalHits++;
          
        } else if (((ballX - ballRadius/2) <= brickRightEdgeX) && (ballX + ballRadius/2 >= brickRightEdgeX) && 
                  ((ballY - ballRadius/2 <= brickRightEdgeY1) && (ballY + ballRadius/2 >= brickRightEdgeY2))) // RIGHT EDGE
          {
            brickHit[brickCounter] = true;
            ballVelocityX = ballVelocityX*(-1); // bounce ball (aka change direction of ballX)
            updateSpeedIntervals4and12();
            updateSpeedIntervalRedAndOrange(brickCounter);
            updateScore(brickCounter);
            totalBricksDestroyed++;
            totalHits++;
            
          } else if ((((ballX - ballRadius/2) <= brickBottomEdgeX2) && ((ballX + ballRadius/2) >= brickBottomEdgeX1)) &&
              (ballY + (ballRadius/2) >= brickBottomEdgeY) && (ballY - ballRadius/2) <= brickBottomEdgeY) // BOTTOM EDGE
            {
              brickHit[brickCounter] = true;
              ballVelocityY = ballVelocityY*(-1); // bounce ball (aka change direction of ballY)
              updateSpeedIntervals4and12();
              updateSpeedIntervalRedAndOrange(brickCounter);
              updateScore(brickCounter);
              totalBricksDestroyed++;
              totalHits++;
              
            }
 
      } 

  }

}

void mouseMoved()
{
  
  if (paddleX > 0 || paddleX < width)
  {
     cursor(CROSS);
     paddleX = mouseX;
  }

}

void mouseClicked()
{
  
  if (gameOver == true)
  {
    gameOver = false;
  }

}
