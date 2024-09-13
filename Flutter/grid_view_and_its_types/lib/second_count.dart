import 'package:flutter/material.dart';

class SecondCount extends StatefulWidget {
  const SecondCount({super.key});

  @override
  State<SecondCount> createState() => _SecondCountState();
}

class _SecondCountState extends State<SecondCount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      GridView.count(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10,children: [
        Container(color: Colors.teal,),
        Container(color: Colors.lime,),
        Container(color: Colors.indigo,),
        Container(color: Colors.green,),
        
      ],)
      ,);
  }
}