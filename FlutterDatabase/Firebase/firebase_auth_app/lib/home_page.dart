import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_app/custom_assets/custom_textfield.dart';
import 'package:firebase_auth_app/custom_assets/myToast.dart';
import 'package:firebase_auth_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'auth_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController NameController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  DatabaseReference dbref = FirebaseDatabase.instance.ref("Todos");
  final key = FirebaseAuth.instance.currentUser!.uid;
  int id = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Welcome to Home', style: TextStyle(fontSize: 20)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Login()));
            },
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: const Text('Logout', style: TextStyle(color: Colors.white)),
          
          ),
        
        ],
        
      ),
      
    floatingActionButton: FloatingActionButton(onPressed: (){
      CustomBottomSheet(null);
    }),

    );
  }

  Future CustomBottomSheet(taskId) {
    double mediaHeigth = MediaQuery.of(context).size.height;

    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        scrollControlDisabledMaxHeightRatio: mediaHeigth,
        sheetAnimationStyle: AnimationStyle(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut),
        constraints: BoxConstraints(
          minHeight: mediaHeigth * 0.75,
        ),
        anchorPoint: const Offset(1, 1),
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
                20, 20, 20, MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              child: Column(
                children: [
                  CustomTextField(
                      hintText: "Meeting With",
                      obscureText: false,
                      controller: NameController),
                  const Spacer(
                    flex: 1,
                  ),
                  CustomTextField(
                      hintText: "Topic",
                      obscureText: false,
                      controller: titleController),
                  const Spacer(
                    flex: 1,
                  ),
                  CustomTextField(
                      hintText: "Description",
                      obscureText: false,
                      controller: descriptionController),
                  const Spacer(
                    flex: 1,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (taskId == null) {
                          id++;
                          dbref.child(key).child("$id").set({
                            "id": id,
                            "MeetingWith": NameController.text,
                            "Title": titleController.text,
                            "Description": descriptionController.text,
                          }).then((value) {
                            Mytoast().showToastMessage("Successfully Added");
                          }).onError(
                            (error, stackTrace) {
                              Mytoast().showToastMessage("$error");
                            },
                          );
                        } else {
                          
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text(
                        "Sign Ups",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
