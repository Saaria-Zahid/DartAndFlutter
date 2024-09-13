import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import 'package:google_fonts/google_fonts.dart';


class ReadSurah extends StatefulWidget {
  final int index;
 ReadSurah(this.index ,{super.key});

  @override
  State<ReadSurah> createState() => _ReadSurahState();
}

class _ReadSurahState extends State<ReadSurah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(quran.getSurahName(widget.index)),
        ),
        
        body: 
        ListView.separated(itemBuilder: (context , index){
          return ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(child: (
                         quran.isSajdahVerse(widget.index, index+1) 
                         ? Text(quran.getVerse(widget.index, index + 1, verseEndSymbol: true),textAlign: TextAlign.right, style: GoogleFonts.amiri(fontSize: 25, color: Colors.amber ))
                         : Text(quran.getVerse(widget.index, index + 1, verseEndSymbol: true),textAlign: TextAlign.right, style: GoogleFonts.amiri(fontSize: 25 ))
                         
                    ),)
                  ),
                  subtitle: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        quran.getVerseTranslation(widget.index, index + 1, verseEndSymbol: true,  translation: quran.Translation.enSaheeh)
                      ),
                    ),
                  ),
                );
        }, separatorBuilder: (context, index){
          return Divider(
          height: 20,
          thickness: 2,
        );
        }, itemCount: quran.getVerseCount(widget.index)),

      );
  }
}


class ReadSurahTurkish extends StatefulWidget {
  final int index;
  ReadSurahTurkish(this.index, {super.key});

  @override
  State<ReadSurahTurkish> createState() => _ReadSurahTurkishState();
}

class _ReadSurahTurkishState extends State<ReadSurahTurkish> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(quran.getSurahNameTurkish(widget.index)),
        ),
        
        body: 
        ListView.separated(itemBuilder: (context , index){
          return ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(child: (
                         quran.isSajdahVerse(widget.index, index+1) 
                         ? Text(quran.getVerseTranslation(widget.index, index + 1, verseEndSymbol: true, translation: quran.Translation.trSaheeh, ),textAlign: TextAlign.right, style: GoogleFonts.amiri(fontSize: 25, color: Colors.amber ))
                         : Text(quran.getVerseTranslation(widget.index, index + 1, verseEndSymbol: true, translation: quran.Translation.trSaheeh,),textAlign: TextAlign.right, style: GoogleFonts.amiri(fontSize: 25 ))
                         
                    ),)
                  ),
                
                );
        }, separatorBuilder: (context, index){
          return Divider(
          height: 20,
          thickness: 2,
        );
        }, itemCount: quran.getVerseCount(widget.index)),

      );;
  }
}
