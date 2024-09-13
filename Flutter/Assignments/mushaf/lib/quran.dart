import 'package:flutter/material.dart';
import 'package:mushaf/readsurah.dart';
import 'package:mushaf/recitation.dart';
import 'package:quran/quran.dart' as quran;


class Quran extends StatefulWidget {
  const Quran({super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(
appBar:
      TabBar(tabs: [Tab(child: Text('Quran'),),Tab(child: Text('Quran In Turkish'),)],
      indicatorColor: Color(0xfff122d48),
      ),

body: 
TabBarView(children: [QuranBySurah(),QuranTurkish()])
,

    ));
  }
}



class QuranBySurah extends StatefulWidget {
  const QuranBySurah({super.key});

  @override
  State<QuranBySurah> createState() => _QuranBySurahState();
}

class _QuranBySurahState extends State<QuranBySurah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
    GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 11, mainAxisSpacing: 11), itemBuilder: (context, index){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ReadSurah(index + 1),));
                    },
          child: Container(
            child: 
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${quran.getSurahNameArabic(index+1,)}",textAlign: TextAlign.right ,style: TextStyle(color: Colors.white, fontSize: 25,),),
                  Text("${quran.getSurahName(index+1,)}",style: TextStyle(color: Colors.white, fontSize: 20),),
                ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xfff122d48),
              boxShadow: [BoxShadow(
                // blurRadius: 10,
                // spreadRadius: 10,
              )]
            ),
          ),
        ),
      );
    },
    itemCount: quran.totalSurahCount,
    )
    ,);
  }
}


class QuranTurkish extends StatefulWidget {
  const QuranTurkish({super.key});

  @override
  State<QuranTurkish> createState() => _QuranTurkishState();
}

class _QuranTurkishState extends State<QuranTurkish> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
    GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 11, mainAxisSpacing: 11), itemBuilder: (context, index){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ReadSurahTurkish(index + 1),));
                    },
          child: Container(
            child: 
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${quran.getSurahNameTurkish(index+1,)}",textAlign: TextAlign.right ,style: TextStyle(color: Colors.white, fontSize: 25,),),
                  // Text("${quran.getSurahName(index+1,)}",style: TextStyle(color: Colors.white, fontSize: 20),),
                ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xfff122d48),
              boxShadow: [BoxShadow(
                // blurRadius: 10,
                // spreadRadius: 10,
              )]
            ),
          ),
        ),
      );
    },
    itemCount: quran.totalSurahCount,
    )
    ,);
  }
}

