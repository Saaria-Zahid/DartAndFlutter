import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: 
        Center(
          child: Column(
            children: [
              Text("Hello"),
              Text("This Is My First App "),
            
            ],
          ),
        )
      ),
    );
  }
}
