import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import 'readsurah.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Al Quran'),
        ),
      body:
      ListView.separated(itemBuilder: (context , index){
        return ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ReadSurah(index+1),));
          },
          leading: 
          CircleAvatar(
            backgroundColor: Colors.blueGrey[100],
            radius: 30,
            child: Text('${index+1}'),
          )
          ,
          title: Text(quran.getSurahName(index+1)),
        );
      }, separatorBuilder: (context, index){
        return Divider(
          height: 40,
          thickness: 2,
        );
      }, itemCount: 114)
      ,
    
    );
  }
}