
import 'package:flutter/material.dart';
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
    return  DefaultTabController(length: 2, child: Scaffold(
      appBar: AppBar(title: Center(child: Text("Saaria Zahid")), backgroundColor:Colors.teal,
      bottom: TabBar(tabs: [Tab(child: Text("Quran")),Tab(child: Text("Recitation")),],
      labelColor: Colors.white,
      ),
      ),
      body: TabBarView(children: [Quran(), Recitation()],),
    ));
  }
}