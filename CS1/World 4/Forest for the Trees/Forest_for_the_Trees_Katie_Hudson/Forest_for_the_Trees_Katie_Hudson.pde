final int numTrees = 10;

class Tree
{
  
  float treeX;
  float treeY;
  int trunkWidth;
  int trunkHeight;
  int treeTopRadius;
  color leafColor;
  color[] availableTreeColors = new color[3];

  
  // constructor to Tree class, that takes x and y coordinates as parameters
  Tree(float xLocation, float yLocation)
  {
    this.availableTreeColors[0] = color(252, 84, 0);   // red
    this.availableTreeColors[1] = color(255, 248, 41); // yellow
    this.availableTreeColors[2] = color(255, 188, 41); // orange

    // save the location
    this.treeX = xLocation;
    this.treeY = yLocation;
    
    // set values for width, height, radius
    this.trunkWidth = 10;
    this.trunkHeight = 20;
    this.treeTopRadius = 25;
    
    this.leafColor = this.availableTreeColors[(int)random(3)]; // random array index 0-2
  
  }
  
  //Tree's own draw function inside the class
  void drawMyself()
  {
      
    //drawTree 
    noStroke();
    
    // Trunk
    rectMode(CENTER);
    fill(142, 105, 74); // brown
    rect(this.treeX, this.treeY, this.trunkWidth, this.trunkHeight);
    
    // Top
    ellipseMode(CENTER);
    fill(this.leafColor);
    ellipse(this.treeX, this.treeY - 20, this.treeTopRadius, this.treeTopRadius);
  
  }

}

// declare and initialize array to store Tree Objects 
Tree[] forestArray = new Tree[numTrees];

void setup()
{
  size(1120, 500);
  
  // these variables do not change and do not need to be in the loop
  float y = height/2;
  int spaceBetween = width/(numTrees + 1);
  
  //create array of 10 tree objects 
  for(int i = 0; i < numTrees; i++)
  {
    
    float x = spaceBetween*(i + 1);
    
    //creating new tree objects in each index of the array
    forestArray[i] = new Tree(x, y);
    
  }
  
  
}

void draw()
{
  
  for(int i = 0; i < numTrees; i++)
  {
    
    //forestArray => [Tree0, Tree1, Tree2]
    Tree currentTreeToDraw = forestArray[i];
    drawTree(currentTreeToDraw);
    
   
  }

}

//function exists outside the tree

void drawTree(Tree insertTree)
{

  insertTree.drawMyself();

}
