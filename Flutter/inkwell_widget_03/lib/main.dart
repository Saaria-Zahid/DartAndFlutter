import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      appBar: AppBar(
        title: Text('Saaria Zahid'),
      ),
      body: 
        Center(
          child: InkWell(
            onDoubleTap: (){
              print('You Liked A Video');
            },
           onTap: () {
           print('You Tap On Container');
           },
           onLongPress: () {
             print('On Long Press');
           },
          

            child: Container(
              width: 200,
              height: 200,
              color: Colors.deepPurple[300],
              child: 
              Text('Click On Container'),
            ),
          ),
        )
      ,
    ),);
  }
}