import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;


class Quran extends StatefulWidget {
  const Quran({super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    ListView.builder(itemCount: quran.totalSurahCount ,itemBuilder: (context, index){
      return Card(
        elevation: 8,
        child: ListTile(
          
          leading: CircleAvatar(child: Text('${index+1}', style: TextStyle(color: Colors.white),), backgroundColor: Color(0xfff122d48),),
          title: Text(quran.getSurahName(index+1) + ' | ' + quran.getSurahNameArabic(index+1)),
          subtitle: Text(quran.getSurahNameEnglish(index+1)),
        ),
      );
    })
    ,);
  }
}