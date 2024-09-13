import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran/quran.dart' as quran;
import 'package:google_fonts/google_fonts.dart';


class RecitationRead extends StatefulWidget {
  final int index;
 RecitationRead(this.index ,{super.key});

  @override
  State<RecitationRead> createState() => _RecitationReadState();
}

class _RecitationReadState extends State<RecitationRead> {


  AudioPlayer audioPlayer = new AudioPlayer();
  IconData playpauseButton = Icons.play_circle_fill_rounded;
  bool isPlaying = true;

  @override
  void dispose(){
    audioPlayer.dispose();
    super.dispose();
  }

Future<void> togglebtn() async{
  try {
    final audioUrl = await quran.getAudioURLBySurah(widget.index);
    audioPlayer.setUrl(audioUrl);
    if (isPlaying) {
      audioPlayer.play();
      setState(() {
        playpauseButton = Icons.pause_circle_filled_rounded;
        isPlaying = false;
      });
    }else{
      audioPlayer.pause();
      setState(() {
        playpauseButton = Icons.play_circle_fill_rounded;
        isPlaying = true;
      });
    }
  }
  catch (e) {
    print('Error playing audio: $e');
  }
} 

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
                    child: Container(child: 
                        (
                             quran.isSajdahVerse(widget.index, index+1) 
                             ? Text(quran.getVerse(widget.index, index + 1, verseEndSymbol: true),textAlign: TextAlign.right, style: GoogleFonts.amiri(fontSize: 25, color: Colors.amber ))
                             : Text(quran.getVerse(widget.index, index + 1, verseEndSymbol: true),textAlign: TextAlign.right, style: GoogleFonts.amiri(fontSize: 25 ))  
                        ),
                        // IconButton(onPressed: togglebtn, icon: Icon(playpauseButton)),
                        
                      
                    ),
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
        
        // bottom bar for audio play only for playpause
       bottomNavigationBar: BottomAppBar(
         color: Color(0xfff122d48),

        child: 
        IconButton(
              onPressed: togglebtn,
              icon: Icon(playpauseButton,),
              color: Colors.white,
            ),
       ),

      );
  }
}

