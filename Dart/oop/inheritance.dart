void main() {
  SuperCar superCar = SuperCar();
  superCar.model = "exh1o2";
  superCar.company = "Tesla";
  superCar.color = "Red";
  superCar.price = 40000;
  superCar.topSpeed = 280;
  superCar.horsepower = 600;

  superCar.display();
  superCar.displaySuperCar();
  
}

class Car {
  String? model;
  String? company;
  String? color;
  int? price;

  void display(){
    print("Model: $model");
    print("Company: $company");
    print("Color: $color");
    print("Price: $price");
  }
}

class SuperCar extends Car{
  int? topSpeed;
  int? horsepower;
  void displaySuperCar(){
    print("Top Speed: $topSpeed");
    print("Horsepower: $horsepower");
  }
}