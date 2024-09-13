import 'package:flutter/material.dart';
import 'first_builder.dart';
import 'second_count.dart';


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
          Navigator.push(context, MaterialPageRoute(builder: (context) => FirstBuilder() ));
    }, child: Text('See GridView.Builder ')),

     ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => SecondCount() ));
    }, child: Text('See GridView.Count ')),

      ],
    )
    ,);

  }
}