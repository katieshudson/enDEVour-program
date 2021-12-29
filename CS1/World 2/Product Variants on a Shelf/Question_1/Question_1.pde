 //Product Variation Variables - Numbered and Colored
final color product1Color = color(227, 69, 79); //red
final color product2Color = color(255, 132, 0); //orange
final color product3Color = color(249, 255, 98); //yellow
final color product4Color = color(152, 234, 38); //green 
final color product5Color = color(65, 145, 240); //blue 
final color product6Color = color(181, 104, 229); // purple
color productColor = color(255); // setting default colour to white 

//Variables for Product X and Y Coordinates
float  productXLocation; 


void setup()
{
    size(800,500);
    background(255);
    
    //Drawing the shelf 
    stroke(0);
    strokeWeight(3);
    fill(149, 149, 149);
    rectMode(CENTER);
    rect(width/2, height*3/5, 700, 20);

}

void draw()
{}



void productShapeAndColor(float rectXCoordinate, float rectYCoordinate, color productColor)
{

  float boxWidth = 40;
  float boxHeight = 100;
  
  //Product Box Shape
  stroke(0);
  strokeWeight(3);
  fill(productColor);
  rectMode(CENTER);
  rect(rectXCoordinate, rectYCoordinate, boxWidth, boxHeight);

}



void keyPressed()
{

    //Variables for Product Y Coordinate
    float  productYLocation = 240; 

    
    
    //user chooses a number between 1 - 6 and it will display a product and its corresponding color
    switch(key)
    {
    
      case '1':
      // set the productVariant to product1
      productColor = product1Color;
      break;
      
      case '2':
      // set the productVariant to product2
      productColor = product2Color;
      break;
      
      case '3':
      // set the productVariant to product3
      productColor = product3Color;    
      break;
      
      case '4':
      // set the productVariant to product4
      productColor = product4Color;    
      break;
  
      case '5':
      // set the productVariant to product5
      productColor = product5Color;      
      break;  
      
      case '6':
      // set the productVariant to product6
      productColor = product6Color;   
      break;  
      
      case ' ':
     //if the productColor is not white, then we can draw our function (the inital value)
      if (productColor != color(255)) {
     
     // have the product appear at a random X coordinate
        productShapeAndColor(random(100, 700), productYLocation, productColor);  
      }
      break;  
      
      default:
        print("Please select a valid key");
        break;  
              
    }

}



//Product Variations - Numbered and Colored


/*
product1 (red)
product2 (orange)
product3 (yellow)
product4 (green)
product5 (blue)
product6 (purple)

*/
