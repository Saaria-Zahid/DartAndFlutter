import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.greenAccent,
          child: Column(
            children: [
              Text('This is the contact page'),
            //Floating Button  
            // FloatingActionButton(onPressed: (){
            //   Navigator.pop(context); // Navigate back to the previous page
            // },child: Text('Back'),)
            
             TextButton(onPressed: (){
              Navigator.pop(context); // Navigate back to the previous page
            },child: Text('Back'),)
            ],
          ),
        )
      ),
    );
  }
}