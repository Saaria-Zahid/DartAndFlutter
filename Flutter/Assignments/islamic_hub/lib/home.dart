import 'package:flutter/material.dart';
import 'hadith.dart';
import 'quran.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/2.jpg',
                fit: BoxFit.cover,
                
              ),
            ),
          ),
          Expanded(
          
            child: Container(
              padding: EdgeInsets.all(10),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                
                
                children: [
                  InkWell(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Quran())),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xfff122d48),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(blurRadius: 5, )],
                        ),
                        child: Center(child: Text('Quran', style: TextStyle(color: Colors.white),)),
                      )),
                  InkWell(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Quran())),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xfff122d48),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(blurRadius: 5, )],
                        ),
                        child: Center(child: Text('Hadith', style: TextStyle(color: Colors.white),)),
                      )),
                  InkWell(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Quran())),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xfff122d48),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(blurRadius: 5, )],
                        ),
                        child: Center(child: Text('Dua', style: TextStyle(color: Colors.white),)),
                      )),
                  InkWell(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Quran())),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xfff122d48),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(blurRadius: 5, )],
                        ),
                        child: Center(child: Text('Reciations', style: TextStyle(color: Colors.white),)),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
