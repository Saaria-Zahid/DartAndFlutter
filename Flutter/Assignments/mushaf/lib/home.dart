import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import 'quran.dart';
import 'recitation.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(
       appBar:
        AppBar(
          backgroundColor: Color(0xfff122d48),
      title: Center(child: 
      Text("Al Mushaf", style: TextStyle(color: Colors.white),)

      ,),
      bottom: TabBar(tabs:[Tab(child: Text('Quran'),), Tab(child: Text('Recitation'))],
      indicatorColor: Color(0xfff122d48),
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white60,
       )
       ),
      body:
      TabBarView(children: [Quran(), Recitation()],)
      ,
    ),
    );
  }
}