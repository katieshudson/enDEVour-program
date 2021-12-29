size(500,500);
background(255);

int houseWidth = 200;
int houseHeight = 150;
int houseX = width/2;
int houseY = height*2/3;

fill(70, 162, 31);
rect(0, height*2/3, width, height/3);

fill(234,210,121);

rectMode(CENTER);
rect(houseX, houseY, houseHeight, houseWidth);

fill(234, 121, 125);
 //<>//

    
 //Issues with the triangle: 
 // 1) x2 was commented out twice for 2 of the x points of the triangle 
 //    when one should be x1 and the other x2.
 // 2) there was an error in the formula for x3 it said houseY instead of houseX
 // 3) the triangle was missing some offsets to correctly position it above the house box


        //the first line is incorrect, it should be houseX - houseWidth/2, not adding. 
        //also included an offset to better align the point to the house box
triangle(houseX - houseWidth/2 + 25, //x1
         
         // this triangle point originally said x2 instead of y1. I updated it to be y1.
         //included an offset to better align the point to the house box
         houseY - houseHeight/2 -25 , //y1
         
         //the x2 point is equal to the houseX coordinate
         // I updated this to reflect the houseX variable
         houseX, //x2
         
         //the houseHeight should not be divided here. Instead should include an offset 
         // or instead of an offset you could multiply the houseHeight by 1.3 or 1.5
         //i have update the formula to include an offset of 50. 
         houseY - houseHeight -50, //y2
         
         //this originally had a formula of: 
         // houseY + houseWidth/2 ... when it should have been: 
         // houseX + houseWidth/2
         // houseY was incorrectly written, and should be houseX
         // also included an offset to better align to the house box
         houseX + houseWidth/2 -25, //x3
         
         //no changes were needed here, except for adding an offset to align to the house box
         houseY - houseHeight/2 -25);//y3
      
