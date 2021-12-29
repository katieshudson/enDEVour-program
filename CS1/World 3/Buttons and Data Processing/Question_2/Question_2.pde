/* 

ASSUMPTION: I am assuming that the array is already sorted from lowest to highest

*/


int[] arrayProductPrices = {15};

float maxBudget = 12;


void setup()
{
  int result = findIndex(arrayProductPrices, maxBudget);
  println("Result is " + result);
}

int findIndex(int[] arrayProductPrices, float maxTotal)
{
  int index = 0;
  int productPricesSum = 0;
  while ((productPricesSum <= maxTotal) && (index < arrayProductPrices.length))
  {
    productPricesSum += arrayProductPrices[index]; 
    index++;    
  }
  
  if(productPricesSum > maxTotal) 
  {
    return (index - 2);  // if you reach your max budget with the sum of values in the array
                         // then you need to subtract 2 from your index to get the index position 
                         // for the value in the arrayProductPrices to know up to which set of numbers
                         // you can add together to maximize your budget. 
  }
  else
  {
    return (index - 1); // if you have a large budget and the sum of your array values are still under  
                        // the budget then you only need to subtract 1 from your index, bc you've
                        // reached the end of your array (even though you still have more budget to "spend")
  }
}
