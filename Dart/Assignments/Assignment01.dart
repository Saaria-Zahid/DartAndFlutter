void main() {
  //Login System
  String name = "Saaria Zahid";
  String email = "saariazahid@gmail.com";
  String pass = "Saaria123";

  //authentication
  String lemail = "saariazahid@gmail.com";
  String lpass = "Saaria123";

  if(lemail == email && lpass == pass ){
    
    print("Welcome ${name} You Are Successfully Logged In");
    
    //Separtion Line
    print("======================================");
    //Separtion Line
    
    //marksheet
    print("Marksheet of 7 Subjects");
    double eng = 82;
    double urdu = 78;
    double computer = 98;
    double sci = 90;
    double math = 80;
    double isl = 70;
    double pst = 65;
    
    double obtTotal = eng+urdu+computer+sci+math+isl+pst;
    double percentage = (obtTotal/700)*100;
    print("Your Percentage is ${percentage.toStringAsFixed(2)}");
    
    
  if(percentage >= 80 && percentage <= 100 ){
    print("Great You Got | A | Grade");
  }else   if(percentage >= 70 && percentage <= 79 ){
    print("Not Bad You Got | B | Grade");
  }else  if(percentage >= 60 && percentage <= 69 ){
    print("Focus On Studies You Got | C | Grade");
  }else{
    print("| Failed | Keep Working Hard Better Luck For Next Time");
  }
    
    //Separtion Line
    print("======================================");
    //Separtion Line
    
  //Even Odd Statement
    print("Even Odd Numbers Finder");
    double evenOddNum = 4;
    if(evenOddNum % 2 == 0 ){
      print("Number ${evenOddNum} is Even ");
    }else{
      print("Number ${evenOddNum} is Odd");
    }
    
    //Separtion Line
    print("======================================");
    //Separtion Line
    
    //Leap Year
    print("Leap Year Finder");
    double leapYear = 2021;
    if(leapYear %4 == 0){
      print("It's Leap Year");
    }else{
            print("It's Not Leap Year");
    }
    
    //Separtion Line
    print("======================================");
    //Separtion Line
    
    // Negative Postive
    print("Positive & Negative Number");
    double pNum = -2;
    if(pNum >= 0){
      print("Possitive");
    }else {
      print("Negative");
    }
    
    
  // Authentication If Ends Here  
  }else{
    print("email or password is incorrect");
  }

}
