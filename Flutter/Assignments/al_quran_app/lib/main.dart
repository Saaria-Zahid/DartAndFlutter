import 'dart:async';
import 'home.dart';
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
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            debugShowCheckedModeBanner: false,
      home: Splash(),);
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

@override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(),))
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
    Center(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.amber[100],
        child: 
        Image.asset('assets/images/quran.png')
        ,
      ),
    )
    ,);
  }
}