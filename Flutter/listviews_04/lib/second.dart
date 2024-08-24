import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {

  var names = ['Saaria','Sudaes','Ali','Huzaifa'];
  var mycolors = [Colors.amber,Colors.blue,Colors.red,Colors.green];
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
    ListView.builder(itemBuilder: (context, index){
        return 
           Container(
            width: 100,
            height: 100,
            color: mycolors[index],
            child: Text(names[index], style: TextStyle(fontSize: 20) ),
          );
    },
    itemCount: names.length,
    itemExtent: 100,
    scrollDirection: Axis.horizontal,
    )
    ,);
  }
}