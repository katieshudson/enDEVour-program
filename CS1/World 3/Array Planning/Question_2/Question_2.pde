



// Initialization of the original array
int[] originalArray = { 0,  99,  7,  4};

// initialization of the new array, which has the same length as the originalArray
int[] newArray = new int[originalArray.length];

int index = 0;
while (index < originalArray.length)
{
  
  newArray[originalArray.length - (index + 1)] = originalArray[index];
  
  index++;


}

println(newArray);
