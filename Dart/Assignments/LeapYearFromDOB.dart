void main() {

  int leapCount = 0;
  
  for(int i = 2009; i<=2024; i++){
    if(i % 4 == 0){
      print("${i} is Leap Year");
      leapCount++;
    }else{
      print("${i} is Not Leap Year");
    }
  }
    print("=====Total Leap Years=====");
    print("Total Leap Years is ${leapCount}");
  
    
}
