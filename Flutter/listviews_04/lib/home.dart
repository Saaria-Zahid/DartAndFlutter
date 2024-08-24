import 'package:flutter/material.dart';
import 'first.dart';
import 'second.dart';
import 'third.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
      Column(
        children: [
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => First(),
            ));
          }, child: Text('Simple List View'),),

          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Second(),
            ));
          }, child: Text('List View Builder'),),

          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Third(),
            ));
          }, child: Text('List View Separated'),),
        ],
      )
    ,);
  }
}