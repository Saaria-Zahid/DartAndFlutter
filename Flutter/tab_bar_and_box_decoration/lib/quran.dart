import 'package:flutter/material.dart';

class Quran extends StatefulWidget {
  const Quran({super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
       GridView.extent(maxCrossAxisExtent: double.infinity, 
       children: [
        Container(
            child: Text('Quran Page'),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(21),
              border: Border.all(
                width: 2,
                color: Colors.black,
              ),
              boxShadow: [BoxShadow(
                blurRadius: 20,
                spreadRadius: 20,
              )]
            ),
          ),
       ],
       )
    ,);
  }
}