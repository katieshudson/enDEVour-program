int numTimesCallFunction = 1000;
float probability = 0.87;

void setup()
{

  int timesTrue = countTrueResults();
  
  //need to convert trueRatio to float because both timesTrue and numTimeCallFunction variables are int
  // which will round up or down and thus not provide a decimal which we need to compare the probability
  float trueRatio = ((float)timesTrue / (float)numTimesCallFunction);  
  println("Ratio obtained is " + trueRatio + ". Desired: " + probability);
  
}


// function should output true with probability p and output false otherwise
boolean randomBool(float p)
{
  
  if (random(0,1) < p) 
  {
    return true;
    
  } else {
  
      return false;
      
    }
  
}


// counting the number of times randomBool() is true  
int countTrueResults()
{
  
  int count = 0;
  int index = 0;
  while (index < numTimesCallFunction)
  {
    
    if(randomBool(probability) == true)
    {
      count++;
    }
    
    index++;
  
  }

  return count;
  
}
