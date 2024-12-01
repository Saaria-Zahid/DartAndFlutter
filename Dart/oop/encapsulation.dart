// void main(){
// Person person = Person("Saaria", 16);

// person.display();
// }

// If you work in same page it not work so you have have to make class in other page

class Person{
  String _name;
  int _age;
 
 Person(this._name, this._age);

String get name => _name;
int get age => _age;

set name(String name){
  _name = name;
}

set age(int age){
  _age = age;
}

  void display(){
    print('Name: $_name, Age: $_age');
  }
}