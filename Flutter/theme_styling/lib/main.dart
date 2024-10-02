import 'package:flutter/material.dart';
import 'package:theme_styling/themes/buttontheme.dart';
import 'package:theme_styling/themes/text_style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 40, color: Colors.amber),
          bodyMedium: TextStyle(fontSize: 30, color: Colors.amber),
          bodySmall: TextStyle(fontSize: 20, color: Colors.amber),

          displayLarge: TextStyle(fontSize: 30, color: Colors.green),
          displayMedium: TextStyle(fontSize: 20, color: Colors.green),
          displaySmall: TextStyle(fontSize: 10, color: Colors.green),
          
        )
      ),

      home: Home(),
    );
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
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('This is a Body Large', style: Theme.of(context).textTheme.bodyLarge),
            Text('This is a Body Medium.', style: Theme.of(context).textTheme.bodyMedium),
            Text('This is a Body Small.', style: Theme.of(context).textTheme.bodySmall),
            SizedBox(height: 20),
            Text('This is a Display large', style: Theme.of(context).textTheme.displayLarge),
            Text('This is a Display medium', style: Theme.of(context).textTheme.displayMedium),
            Text('This is a Display small', style: Theme.of(context).textTheme.displaySmall,),

            // EleBtn("Go to Home", Home(),  conte: 'context' )
            SizedBox(
              height: 50,
            ),
            EleBtn('Click Now', ThemeSyle(), context: context,)

          ],
        ),
      ),
    );
  }
}

class ThemeSyle extends StatefulWidget {
  const ThemeSyle({super.key});

  @override
  State<ThemeSyle> createState() => _ThemeSyleState();
}

class _ThemeSyleState extends State<ThemeSyle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
    Column(children: [
      Text('Big Theme Text From Style Sheet', style: bigText(),),
      Text('Big Theme Text From Style Sheet', style: bigText().copyWith(color: Colors.blue, fontWeight: FontWeight.normal),),
      Text('Big Theme Text From Style Sheet', style: bigText(),),
      Text('Big Theme Text From Style Sheet', style: bigText().copyWith(color: Colors.amber),),
    ],)
    ,);
  }
}