import 'package:flutter/material.dart';
import 'contact.dart  ';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
    
    Center(
      child: Container(
        child: Column(children: [
          Text('Saaria Zahid First Application'),

          ElevatedButton(
            onPressed:(){
            Navigator.push(context, 
            MaterialPageRoute(builder: (context) => Contact(),));
          }, child: Text('Next Page')),

          
         ],)
      ),
    )
    
    
    ,);
  }
}