final int rectWidth = 50;
float rectHeight = 200;
float rectY;


void setup()
{
  int[] arrayData = new int[10];
  
  size(600,300);
  rectY = height/2 - rectHeight/2;
  
  // initializing the data in the array 
  int index = 0;
  while (index < arrayData.length) 
  {
    arrayData[index] = (int)random(1, 20);
    println(arrayData[index]);
    
    index++;

  }
  
  int largestValueInArray = findLargestValueInArray(arrayData);
  drawData(largestValueInArray, arrayData);  
  
}



void drawData(int largestValueInArray, int[] arrayData)
{
  int spaceBetween = (width - (arrayData.length*rectWidth)) / (arrayData.length + 1);
  
  int i = 0;
  boolean firstMaxNumberIndexFill = true;
  int currX = spaceBetween;
  while (i < arrayData.length)
  {
    int textInRect = arrayData[i];
    
    float proportionalHeight = (float)arrayData[i]/(float)largestValueInArray;
    float adjustedRectHeight = (proportionalHeight)*(rectHeight);
    
    if (arrayData[i] == largestValueInArray && firstMaxNumberIndexFill == true) 
    {
       fill(90, 247, 105); // color rect with max value in array: green
       firstMaxNumberIndexFill = false; // ensures that the duplicate max values are only colored on the 1st instance 
       
    } else {
      
        fill(144, 192, 252); // blue 
      }
     
    rect(currX, rectY, rectWidth, adjustedRectHeight);
    
    fill(255);
    textSize(24);
    textAlign(CENTER, CENTER);
    text(textInRect, currX + rectWidth/2, rectY + rectHeight/2);
    
    i++;
    currX += rectWidth + spaceBetween;
  }
  
}


int findLargestValueInArray(int[] arrayData)
{
  
  int maxValue = -1;
  int indexOfMaxValue = -1;
  int currentIndex = 0;
  while (currentIndex < arrayData.length)
  {
    
    if (arrayData[currentIndex] > maxValue)
    {
       maxValue = arrayData[currentIndex];
       indexOfMaxValue = currentIndex; // 1st instance of max value in the array, if there are duplicate values
    }
   
   currentIndex++;
   
  }
 
 println("The maximum value in the array of Data is " + maxValue + " which occurs at Index " + indexOfMaxValue);

 return maxValue; 
 
}
