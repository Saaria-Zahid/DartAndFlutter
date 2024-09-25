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
    
    return const MaterialApp(
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
          
          child: const ListTile(
            title: Text('My First Card'),
          ),
        ),
         Card(
          elevation: 10,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20) ,borderSide: const BorderSide(color: Colors.green)),
          
          child: const ListTile(
            title: Text('My First Card'),
          ),
        ),
       
        Card(
          child: Container(
            width: 150,
            height: 150,
            child: Center(child: Text('Saz')),
          ),
          shape: CircleBorder(side: BorderSide(width: 3,color: Colors.green)),
          elevation: 10,
          margin: EdgeInsets.all(10),
          surfaceTintColor: Colors.amber,

        )

        ],
       )
      ,);
  }
}