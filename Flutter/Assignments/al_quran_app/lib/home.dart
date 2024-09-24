
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
            // Navigator.push(context, MaterialPageRoute(builder: (context) => Recitation(index+1),));
          },
          leading: 
          CircleAvatar(
            backgroundColor: Colors.amber[100],
            
            radius: 30,
            child: Text('${index+1}', style: TextStyle(color: Colors.black),),
          )
          ,
          title: Text(quran.getSurahName(index+1)+' - '+quran.getSurahNameArabic(index+1)),
          subtitle: Text(quran.getSurahNameEnglish(index+1)),
          trailing: Column(children: [
             quran.getPlaceOfRevelation(index+1) == 'Makkah'
          ? Image.asset('assets/images/makkah.png', width: 30, height: 30,)
          : Image.asset('assets/images/madina.png', width: 30, height: 30,),
           Text('Ayahs ${quran.getVerseCount(index+1)}',),
          ],)
        );
      }, separatorBuilder: (context, index){
        return Divider(
          height: 20,
          thickness: 0,
        );
      }, itemCount: 114)
      ,
    
    );
  }
}