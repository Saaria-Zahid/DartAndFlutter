import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InkWell(
            onTap: () async {
                DateTime? datepicker = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2030));
                if (datepicker != null) {
                  print('Seleceted ${datepicker}');
                }
              },
            child: Container(
              width: double.infinity,
              height: 100,
              color: Colors.teal,
              child: 
              Center(child: Text('Date Picker'))
              ,
            ),
          ),

            SizedBox(
              height: 50,
            ),

          InkWell(
            onTap: () async {
                  TimeOfDay? timepicker = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      initialEntryMode: TimePickerEntryMode.dial);
                  if (timepicker != null) {
                    print('Seleceted ${timepicker.hour}:${timepicker.minute}');
                  }
                },
            child: Container(
              width: double.infinity,
              height: 100,
              color: Colors.teal,
              child: Center(child: Text('Time Picker')),
            ),
          )
        ],
      ),
    );
  }
}
