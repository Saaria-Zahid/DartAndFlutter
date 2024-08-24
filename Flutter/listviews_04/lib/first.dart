import 'package:flutter/material.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
    ListView(
      scrollDirection: Axis.horizontal,
  
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Name One', style: TextStyle(fontSize: 20) ,),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Name Two', style: TextStyle(fontSize: 20) ),
        ) ,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Name Three', style: TextStyle(fontSize: 20)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Name Four', style: TextStyle(fontSize: 20)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Name Five', style: TextStyle(fontSize: 20)),
        ),
      ],
    ),);
  }
}