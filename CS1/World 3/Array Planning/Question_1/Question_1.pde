

// Initialization (First way)
int[] myProductPricesList = new int[productListSize];
myProductPricesList[0] = 15;
myProductPricesList[1] = 10;
myProductPricesList[2] = 18;
myProductPricesList[3] = 25;
myProductPricesList[4] = 8;
myProductPricesList[5] = 19;
myProductPricesList[6] = 29;
myProductPricesList[7] = 6;

// Initialization (Second way)
int[] myProductPricesList = { 4,  14,  11,  100,  6};


//do the iteration of array
int highestAffordablePrice = 0;
int budget = 12;


int index = 0;
while (index < myProductPricesList.length)
{
  int value = myProductPricesList[index];
  if(value < budget)
  {
    if(value > highestAffordablePrice)
    {
      highestAffordablePrice = value;
    }

  }

  index++;
}

println(highestAffordablePrice);
