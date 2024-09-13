import 'package:flutter/material.dart';
import 'readsurahrecitation.dart';
import 'package:quran/quran.dart' as quran;


class Recitation extends StatefulWidget {
  const Recitation({super.key});

  @override
  State<Recitation> createState() => _RecitationState();
}

class _RecitationState extends State<Recitation> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: 
    GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 11, mainAxisSpacing: 11), itemBuilder: (context, index){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => RecitationRead(index + 1),));
                    },
          child: Container(
            child: 
              Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${quran.getSurahNameArabic(index+1,)}",textAlign: TextAlign.right ,style: TextStyle(color: Color(0xfff122d48), fontSize: 25,),),
                  Text("${quran.getSurahName(index+1,)}",style: TextStyle(color: Color(0xfff122d48), fontSize: 20),),
                ],
            ),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blueGrey[100],
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