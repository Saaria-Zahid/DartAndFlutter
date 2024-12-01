import 'encapsulation.dart';

void main(){
Person person = Person("Saaria", 16);

person.display();

var a = person.name = "Saaria Zahid";
var b = person.age = 12;
print("Person Name $a Age is $b");
}
