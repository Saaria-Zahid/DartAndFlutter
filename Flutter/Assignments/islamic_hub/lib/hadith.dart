// import 'package:flutter/material.dart';
// import 'package:hadith/hadith.dart' as hadith;


// class Hadith extends StatefulWidget {
//   const Hadith({super.key});

//   @override
//   State<Hadith> createState() => _HadithState();
// }

// class _HadithState extends State<Hadith> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: 
//     Column(children: [
//       Container(width: double.infinity, height: 200, color: Color(0xfff122d48), 
//       child: Center(child: Text('Hadith'), ) ,),

//       Expanded(
//         child: GridView.builder(itemCount: 10 ,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context, index){
//         return Container(
//           margin: EdgeInsets.all(10),
//           decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
//           child: Text('${hadith.getHadiths(hadith.Collections.bukhari, index+1)}'),
//         );
        
//         }),
//       ),


//     ],)
//     ,);
//   }
// }