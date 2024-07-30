void main() {
 
  String transType = "bike";
  
  if(transType == "bike"){
    
    int products = 10;
    double price = 25000;
    
    print("You Purchased ${products} Product for ${price}");
    
    //nested if
    if(price == 5000){
      
      double disPer = 25;
      double discount = (price/100)*disPer;
      print("You Got ${disPer}% Discount Your Total Is ${price-discount}");

    }else if(price == 10000){
      
      double disPer = 50;
      double discount = (price/100)*disPer;
      print("You Got ${disPer}% Discount Your Total Is ${price-discount}");
      
    }else if(price == 25000){
      
      double disPer = 75;
      double discount = (price/100)*disPer;
      print("You Got ${disPer}% Discount Your Total Is ${price-discount}");
    }
    
    
    
    //Parent If Else
   }else{
    
    int products = 20;
    double price = 20000;
    
    print("You Purchased ${products} Product for Rs${price}");
   
    // Nested If
    if(price == 20000){
      
      double disPer = 10;
      double discount = (price/100)*disPer;
      print("You Got ${disPer}% Discount Your Total Is ${price-discount}");
      
    }else if(price == 30000){
      
      double disPer = 50;
      double discount = (price/100)*disPer;
      print("You Got ${disPer}% Discount Your Total Is ${price-discount}");
      
    }else if(price == 75000){
      
      double disPer = 75;
      double discount = (price/100)*disPer;
      print("You Got ${disPer}% Discount Your Total Is ${price-discount}");
      
    }
    
  }
    
}

