/*

WELCOME TO A MERCHANT'S UPCOMING FLASH SALE!

There are 2 interactive areas: 
1) Merchant 
- Feel free to click on the merchant to see his face change color to represent the various emotions he will go through
- When you click the merchant will also move up and down to simulate the adrenaline of prepping for and during a flash sale
- The more you click on the merchant, the faster he moves! But he will reach a point where he will start over, after coming down from his adrenaline rush


2) Store 
- Feel free to click on the store to watch sales start coming in!
- The more you click on the store, the bigger the coin will get, and the faster it will move
- The size and speed of the coin is to represent the accumulation of revenue throughout a flash sale!
- you will reach a point where the sales will stop and start over


*/



//image and font variables 
PFont textFont;
PImage logo;
PImage coin;

//global merchantbody 
float bodyWidth = 50;
float bodyHeight = 100;

//global coin variables
float coinDiameter = 60;
float coinX; 
float coinY; 

float mouseClickCountArea1 = 0; // starting with a mouse count of 0 for Area1
float mouseClickCountArea2 = 0; // starting with a mouse count of 0 for Area2

//speed variables
float merchantYSpeed = 0; // y speed variable to move merchant - no x speed variable needed.
float coinXSpeed = 2; // x speed variable to move coin
float coinYSpeed = 2; // y speed variable to move coin

//starting point for frame of merchant figure
float merchantFrameX = 200;
float merchantFrameY = 395;

//size variables for frame of merchant figure
float merchantFrameWidth = 75;
float merchantFrameHeight = 200;

//starting head color of merchant
color merchantCurrentHeadColor = color(255);


void setup()
{
    size(800,500);
    smooth();
    
    //set up the font
    textFont = loadFont("AvenirNext-Heavy-48.vlw");
    textAlign(CENTER, CENTER); // horizontal and vertical alignment    
    
    //loading and resizing the images
    logo = loadImage("shopify_glyph.png");
    logo.resize((int)(0.6*bodyWidth), 0);
    coin = loadImage("coin_image.png");
    imageMode(CENTER);
    
    // starting point of the coin
    coinX = width*3/4;
    coinY = height*0.45;
   

}

void draw()
{
    background(252, 250, 250);
    storeFrontShape();
    drawMerchantFigure(merchantFrameX, merchantFrameY, merchantCurrentHeadColor); 
    updateMerchantPosition();
    
    
    if (mouseClickCountArea2 >= 1) // in order for the coin to be drawn each frame it needs to be in draw, however it should only be called AFTER 1 mouseclick
      {
        drawCoinFunction(coinX, coinY);
        updateCoinPosition();
      }
    

}


void drawMerchantFigure(float insertMerchantFrameX, float insertMerchantFrameY, color insertMerchantHeadColor) // creating a box/frame of merchant
{
  
  //merchant figure variables
  float bodyX = insertMerchantFrameX;
  float bodyY = insertMerchantFrameY;
  float bodyWidth = merchantFrameWidth*0.6;
  float bodyHeight = merchantFrameHeight/2;
  
  float headX = insertMerchantFrameX;
  float headY = insertMerchantFrameY - (merchantFrameHeight*3/8);
  
  float headDiameter = 50;

  
  //head
  ellipseMode (CENTER);
  fill(insertMerchantHeadColor);
  strokeWeight(2);
  ellipse (headX, headY, headDiameter, headDiameter);
  
  //left eye 
  noStroke();
  fill(0);
  ellipseMode(CENTER);
  ellipse(headX - headDiameter/5, headY - headDiameter/5, headDiameter/5, headDiameter/5);
  
  //right eye 
  noStroke();
  ellipseMode(CENTER);
  ellipse(headX + headDiameter/5, headY - headDiameter/5, headDiameter/5, headDiameter/5);
  
  //Smile
  noStroke();
  arc(headX, headY + headDiameter/6, headDiameter/2, headDiameter/2, 0, PI);

  //body
  stroke(0);
  strokeWeight(2);
  fill(255);
  rectMode (CENTER);
  rect (bodyX, bodyY, bodyWidth, bodyHeight); 
  image(logo, bodyX, bodyY);
  
  //arms
  line (bodyX - bodyX*0.12, bodyY - bodyHeight*3/8, bodyX - bodyX*0.3, bodyY + 5);
  line (bodyX + bodyX*0.12, bodyY - bodyHeight*3/8, bodyX + bodyX*0.3, bodyY + 5);
  
  //legs
  line (bodyX - bodyX*0.05, bodyY + bodyHeight/2, bodyX - bodyX*0.05, bodyY + bodyHeight); // left leg
  line (bodyX + bodyX*0.05, bodyY + bodyHeight/2, bodyX + bodyX*0.05, bodyY + bodyHeight); // right leg
  
  //feet
  line (bodyX - bodyX*0.05, bodyY + bodyHeight, bodyX - bodyX*0.1, bodyY + bodyHeight);
  line (bodyX + bodyX*0.05, bodyY + bodyHeight, bodyX + bodyX*0.1, bodyY + bodyHeight);

}


void storeFrontShape()
{
  
  //store front variables
  float storeXlocation = width*3/4;
  float storeYlocation = height*5/6;
  float storeWidth = width*5/11;
  float storeHeight = height/2;
  float doorXlocation = storeXlocation + 110;
  float doorYlocation = storeYlocation + 28;
  float doorWidth = storeWidth*1/5;
  float doorHeight = storeHeight*0.45;
  float doorKnobSize = 15;
  float windowWidth = doorWidth*2.7;
  float windowHeight = doorHeight;
  float windowXlocation = storeXlocation - 60;
  float windowYlocation = storeYlocation;
  
  //main structure
  stroke(0);
  strokeWeight(1);
  fill(207, 177, 211);
  rectMode(CENTER);
  rect(storeXlocation, storeYlocation, storeWidth, storeHeight);
  
  //top structure with text 
  fill(151, 140, 227);
  rect(storeXlocation, storeYlocation - (storeYlocation*1/3), storeWidth, storeHeight/4);
  fill(0);
  textFont(textFont, 48);
  text("STORE", storeXlocation, storeYlocation - (storeYlocation*1/3));
    
  //window 
  fill(234, 234, 230);
  rect(windowXlocation, windowYlocation, windowWidth, windowHeight);
  textFont(textFont, 38);
  fill(250, 28, 35);
  text("Flash", windowXlocation - 30, windowYlocation - 25);
  text("Sale!", windowXlocation + 25, windowYlocation + 20);
    
  //door
  fill(175, 154, 115);
  rect(doorXlocation, doorYlocation, doorWidth, doorHeight);
  
  //door handle 
  fill(250, 241, 73);
  ellipseMode(CENTER);
  ellipse(doorXlocation + 25, doorYlocation + 15, doorKnobSize, doorKnobSize);

}


void drawCoinFunction(float insertCoinX, float insertCoinY)
{
 
  //drawing the coin
  ellipseMode(CENTER);
  ellipse(insertCoinX, insertCoinY, coinDiameter, coinDiameter);
  coin.resize((int)(0.99*coinDiameter), 0); //sizing the image to fit the ellipse
  image(coin, insertCoinX, insertCoinY);  // using an image with a dollar sign within the coin

}

void updateMerchantPosition()
{  
  //moving the merchant up and down formula
  merchantFrameY = merchantFrameY + merchantYSpeed;
  //print("merchantBodyY is " + merchantFrameY + "\n");
  
  if (((merchantFrameY + merchantFrameHeight/2) > height) || ((merchantFrameY - merchantFrameHeight/2) < height/4))  //boundaries for which the merchant can bounce
    {
      merchantYSpeed = merchantYSpeed * -1;
    }
}


void changeMerchantYSpeed()  
{
  merchantYSpeed = 3; //setting the initial speed of the merchant figure
}


void updateCoinPosition()
{

  coinX = coinX + coinXSpeed; // x speed formula
  coinY = coinY + coinYSpeed; // y speed formula
   
  
  if (((coinX + coinDiameter/2) > width) || ((coinX - coinDiameter/2) < 0)) // if coin tries to go beyond width of canvas
    {
      coinXSpeed = coinXSpeed * -1; // then change direction 
    }
  
  if (((coinY + coinDiameter/2) > height) || ((coinY - coinDiameter/2) < 0)) // if coin tries to go beyond height of canvas
    {
      coinYSpeed = coinYSpeed * -1; // then change direction    
    }
  
}


void mouseClicked()
{
  
  //Mouse Click Area #1 --> Merchant
  if (mouseX < width/2) //if the mouseX is in the click area #1
    {
      
      mouseClickCountArea1 = mouseClickCountArea1 + 1; //increase the mouseClick for Area1 by 1
      print("mouseClickCountArea1 + is " + mouseClickCountArea1 + "\n");
      
      merchantCurrentHeadColor = color(random(0, 255), random(0, 255), random(0, 255)); // change the merchant head color
      
        if (merchantYSpeed == 0) //if merchant is not moving, then change the speed to make him move. 
          {
            changeMerchantYSpeed(); // change the merchant Y speed function        
          }
        
            else if ((merchantYSpeed > 0)) // positive speed - merchant is moving down
              {
                merchantYSpeed = merchantYSpeed + 1;        
              }
            
            else if (merchantYSpeed < 0) // negative speed - merchant is moving up
              {
                merchantYSpeed = merchantYSpeed - 1;        
              }
       
       if (mouseClickCountArea1 > 15)  // if the mouseclick count is over 15, then reset the click count and the merchant speed.
         {
           mouseClickCountArea1 = 0;
           merchantYSpeed = 0;
         }
        
    }
  
  //Mouse Click Area #2 --> Store
  if ((mouseX > width/2) && (mouseY < height)) // if the mouse is clicked around the store
    {
    
     mouseClickCountArea2 = mouseClickCountArea2 + 1; //increase the mouseClick for Area1 by 1
     
     if (mouseClickCountArea2 >= 2) // if the mouseclick count is equal to or greater than 2
       {
         coinDiameter = coinDiameter*1.1; //increase the size of the coin
         
         if (coinXSpeed > 0) // from 2 clicks onwards, if the coinXSpeed is positive
           {
             coinXSpeed = coinXSpeed + 1; // increase the coinXSpeed by 1
           }
        
          else if (coinXSpeed < 0) // if the coinXSpeed is negative
            {
              coinXSpeed = coinXSpeed - 1; // increase the coinXSpeed by -1
            }
        
         if (coinYSpeed > 0) // if the coinYSpeed is positive
           {
             coinYSpeed = coinYSpeed + 1; // then increase the coinYSpeed by 1
           }
          else if (coinYSpeed < 0) // if the coinYSpeed is negative
            {
              coinYSpeed = coinYSpeed - 1; // then increase the coinYSpeed by -1
            }
       
       }
    
    if (mouseClickCountArea2 == 10) // if the mouse click count reaches 10 in Area2 then the coin will go back to its original position and start again
      {
        //resetting all of the values
        mouseClickCountArea2 = 0;
        coinXSpeed = 1;
        coinYSpeed = 1;
        coinDiameter = 60;
        coinX = width*3/4;
        coinY = height*0.45;
      }
  
    }
  

}
