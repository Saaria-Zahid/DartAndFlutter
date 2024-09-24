import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran/quran.dart' as quran;
import 'package:google_fonts/google_fonts.dart';


class ReadSurah extends StatefulWidget {
  final int index;
 ReadSurah(this.index ,{super.key});

  @override
  State<ReadSurah> createState() => _ReadSurahState();
}

class _ReadSurahState extends State<ReadSurah> {


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
floatingActionButton: FloatingActionButton(
          onPressed: togglebtn,
          child: Icon(playpauseButton),
        ),

      );
  }
}



// class Recitation extends StatefulWidget {
//   var indexSurah;
//   Recitation(this.indexSurah, {super.key});

//   @override
//   State<Recitation> createState() => _RecitationState();
// }

// class _RecitationState extends State<Recitation> {
//   AudioPlayer audioPlayer = AudioPlayer();
//   IconData playpauseButton = Icons.play_circle_fill_rounded;
//   bool isplaying = true;

//   @override
//   void dispose() {
//     audioPlayer.dispose();

//     super.dispose();
//   }

//   Future<void> togglebtn() async {
//     try {
//       final audioUrl = await quran.getAudioURLBySurah(widget.indexSurah);
//       audioPlayer.setUrl(audioUrl);

//       if (isplaying) {
//         audioPlayer.play();

//         setState(() {
//           playpauseButton = Icons.pause_circle_filled_rounded;
//           isplaying = false;
//         });
//       } else {
//         audioPlayer.pause();

//         setState(() {
//           playpauseButton = Icons.play_circle_fill_rounded;
//           isplaying = true;
//         });
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             "سورۃ " + quran.getSurahNameArabic(widget.indexSurah),
//             style: GoogleFonts.amiriQuran(textStyle: TextStyle(fontSize: 30)),
//             textDirection: TextDirection.rtl,
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Center(
//             child: CircleAvatar(
//               backgroundColor: Color(0xff272729),
//               radius: 100,
//               backgroundImage: AssetImage(
//                 "assets/images/alaffasy.png",
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Container(
//             width: double.infinity,
//             color: Color.fromARGB(255, 49, 13, 1),
//             // height: double.infinity,
//             child: Center(
//                 child: IconButton(
//                     onPressed: togglebtn,
//                     icon: Icon(color: Colors.white, playpauseButton))),
//           ),
//         ],
//       ),
//     );
//   }
// }