class Portfolio 
{

Stock[] stockList;
int[] stockQuantityList;

}




Stock[] listOfPossibleStocks = new Stock[]
{

shopifyStock,
stripeStock,
TelsaStock,
appleStock,
googleStock,
citigroupStock,
pfizerStock,
walmartStock,
generalElectricStock,
morganStanleyStock,
.
.
.
n-1;

}


// initialization example 1 of a new Stock object 
Stock shopifyStock = new Stock();
shopifyStock.stockName = “Shopify Inc”;
shopifyStock.currentPrice = 1425.85;
shopifyStock.historyOfPrices = new int[] {850, 925, 1200, 1150, 1375, 1420 …. n-1};
shopifyStock.industryName = “technology”;
shopifyStock.publiclyTraded = true;
shopifyStock.highVolumeTrade = true;

// initialization example 2 of new Stock object
Stock appleStock = new Stock();
appleStock.stockName = “Apple Inc”;
appleStock.currentPrice = 148.69;
appleStock.historyOfPrices = new int[] {75, 150, 200, 350, 99, 148 … n-1};
appleStock.industryName = “technology”;
appleStock.publiclyTraded = true;
appleStock.highVolumeTrade = true;


Portfolio katiesStockPortfolio = new Portfolio();
katiesStockPortfolio.stockList = new Stock[]{listOfPossibleStocks[0], listOfPossibleStocks[2], listOfPossibleStocks[4]}
katiesStockPortfolio.stockQuantityList = new int[]{15, 4, 6};



int valueOfPortfolio(Portfolio userPortfolio)
{

  float valueOfStocks = 0;

  int index = 0;
  for (int index = 0; index < userPortfolio.stockList.length; index++)
  {
    valueOfStocks += (userPortfolio.stockList[index].currentPrice) * (userPortfolio.stockQuantityList[index]);
  
  }
  
  return valueOfStocks;
  
}
