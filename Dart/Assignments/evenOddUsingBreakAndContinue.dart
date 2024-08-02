void main() {
  for(int i = 0; i <= 100; i++){
    
    // For num not printing
    if(i == 22 || i == 24 || i == 26 || i == 28 || i == 30 ){
      continue;
    }
    
    //to break on 50
    if(i == 50){
         break;
      }
     //for even num and odd
    if(i % 2 == 0){
      print("${i} is Even Number");
    }
      
     else{
         print("${i} is Odd Number");
       }
    }
    
}
