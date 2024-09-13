import 'dart:async';

import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
    Timer(Duration(seconds: 5), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home())));
  }
  @override

  Widget build(BuildContext context) {
  
    return Scaffold(body: 
    Container(
      child: Image.asset('assets/images/logo.png'),
      color: Color(0xfff122d48),
      width: double.infinity,
      height: double.infinity,
    )
    ,);
  }
}