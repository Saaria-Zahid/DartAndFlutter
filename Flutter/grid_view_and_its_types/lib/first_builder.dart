import 'package:flutter/material.dart';

class FirstBuilder extends StatefulWidget {
  const FirstBuilder({super.key});

  @override
  State<FirstBuilder> createState() => _FirstBuilderState();
}

class _FirstBuilderState extends State<FirstBuilder> {

var myColor = [
    Colors.teal,
    Colors.blue,
    Colors.brown,
    Colors.purple,
    Colors.pink,
    Colors.red
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
        GridView.builder(gridDelegate: 
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2)
        , itemBuilder: (context, index){
          return Container(
            
            color: myColor[index],
          );
        },
        itemCount: myColor.length,
        )
    ,);
  }
}