import 'package:flutter/material.dart';
 
 void main() {
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
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),);
  }
}


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
       Column(
        children: [
           Card(
          elevation: 10,
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10) ) ,
          
          child: ListTile(
            title: Text('My First Card'),
          ),
        ),
         Card(
          elevation: 10,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20) ,borderSide: BorderSide(color: Colors.green)),
          
          child: ListTile(
            title: Text('My First Card'),
          ),
        ),
         Card(
          elevation: 10,
          shape: CircleBorder(side: BorderSide(width: 1 , color: Colors.green)),
          
          child: Container(
            child: 
             Text('My First Card'),
          ),
        )

        ],
       )
      ,);
  }
}