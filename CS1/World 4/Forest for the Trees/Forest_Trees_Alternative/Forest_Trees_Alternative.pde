final int numOfTrees = 10;

class Tree 
{
  
  float treeX;
  float treeY;
  int treeTrunkWidth;
  int treeTrunkHeight;
  int treeTropRadius;
  color currentTreeColor;
  color[] assignTreeColor = new color[4];
  
  Tree(float setX, float setY)
  {
    
    // colors for array 
    this.assignTreeColor[0] = color(222, 85, 0);    // crimson red
    this.assignTreeColor[1] = color(255,141, 0);    // orange
    this.assignTreeColor[2] = color(232, 205, 0);   // yellow
    this.assignTreeColor[3] = color(193, 101, 2);   // orange-brown 
    
    
    // save x and y location
    this.treeX = setX;
    this.treeY = setY;
    
    // set values for width, height and radius of tree
    this.treeTrunkWidth = 20;
    this.treeTrunkHeight = 40;
    this.treeTropRadius = 50;
    
    this.currentTreeColor = assignTreeColor[(int)random(3)];
  
  }
  
}


// create forest array with numOfTrees spots 
Tree[] forestArray = new Tree[numOfTrees];

void setup()
{
  
  size(1120, 500);
  background(255);
  
  float spaceBetween = width / (numOfTrees + 1);
  float treeYLocation = height/2;
  
  // create 10 tree objects in array 
  for(int i = 0; i < numOfTrees; i++)
  {
    
    float treeXLocation = spaceBetween * (i + 1);
    
    forestArray[i] = new Tree(treeXLocation, treeYLocation);
  }

}

void draw()
{
  
  for(int i = 0; i < numOfTrees; i++)
  {
    
    Tree currentTreeToDraw = forestArray[i];
    drawTree(currentTreeToDraw);
  
  }
  
}


void drawTree(Tree insertTree)
{
  
  float treeTopX = insertTree.treeX + 10;
  float treeTopY = insertTree.treeY - 7;
  float treeTrunkX = insertTree.treeX;
  float treeTrunkY = insertTree.treeY + 15;
  
  //trunk
  noStroke();
  fill(111, 76, 0);
  rect(treeTrunkX, treeTrunkY, insertTree.treeTrunkWidth, insertTree.treeTrunkHeight);
  
  //tree top
  fill(insertTree.currentTreeColor);
  ellipse(treeTopX, treeTopY, insertTree.treeTropRadius, insertTree.treeTropRadius);
  

}
