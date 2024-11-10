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
    return MaterialApp(home: Splash(),);
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
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () => {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()))
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xfff122d48),
        child: Image.asset('assets/images/logo.png'),
      
      ),
    );
  }
}