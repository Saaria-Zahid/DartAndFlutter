import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Registrtion(),
    );
  }
}


class Registrtion extends StatefulWidget {
  const Registrtion({super.key});

  @override
  State<Registrtion> createState() => _RegistrtionState();
}

class _RegistrtionState extends State<Registrtion> {

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();


Future<void> myApi() async {
  final url = Uri.parse("http://192.168.0.116/api/register.php");

  final response = await http.post(url, body: {
    'name': name.text,
    'email': email.text,
    'password': pass.text
  });

  if (response.statusCode == 200) {
    try {
      Map<String, dynamic> data = json.decode(response.body); // Properly decoding JSON
      print("Success: $data");
    } catch (e) {
      print("JSON Decode Error: $e");
    }
  } else {
    print("Failed: ${response.body}");
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TextField(
          controller: name,
        ),
        TextField(
          controller: email,
        ),
        TextField(
          controller: pass,
        ),

        ElevatedButton(onPressed: (){myApi();}, child: Text("Submit"))
      ],),
    );
  }
}