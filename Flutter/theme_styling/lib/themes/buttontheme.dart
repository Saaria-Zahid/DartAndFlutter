

import 'package:flutter/material.dart';


ElevatedButton EleBtn(var text, var navroute, {required BuildContext context}){
return ElevatedButton(onPressed: (){
  Navigator.push(context, MaterialPageRoute(builder: (context) => navroute,));
  // Navigator.pop(context, MaterialPageRoute(builder: (context) => navroute))
},
style: ElevatedButton.styleFrom(
    elevation: 8,
    padding: EdgeInsets.only(top: 12, bottom: 12, left: 6, right: 6),
    backgroundColor: Colors.green.shade300,
    side: BorderSide( style: BorderStyle.solid, color: Colors.green.shade500),
    shape: BeveledRectangleBorder(),
    fixedSize: Size.fromWidth(250),
    
 
  ),
 child: Text(text.toString(), style: TextStyle(color: Colors.black, fontSize: 22),));
}