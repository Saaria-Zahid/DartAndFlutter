import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_app/custom_assets/custom_textfield.dart';
import 'package:firebase_auth_app/custom_assets/myToast.dart';
import 'package:firebase_auth_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
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
      body:
          // ElevatedButton(
          //   onPressed: () async {
          //     await FirebaseAuth.instance.signOut();
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => const Login()));
          //   },
          //   style: ElevatedButton.styleFrom(
          //       padding: const EdgeInsets.symmetric(vertical: 20),
          //       backgroundColor: Colors.black,
          //       shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(10))),
          //   child: const Text('Logout', style: TextStyle(color: Colors.white)),

          // ),

          FirebaseAnimatedList(
        query: dbref.child(key),
        itemBuilder: (context, snapshot, animation, index) {
          final id = snapshot.child("id").value.toString();
          final description = snapshot.child("Description").value.toString();
          final title = snapshot.child("Title").value.toString();
          final meetingWith = snapshot.child("MeetingWith").value.toString();
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x000000).withOpacity(1),
                      offset: Offset(0, 3),
                      blurRadius: 4,
                      spreadRadius: -4,
                    )
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        meetingWith,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      // Icon(Icons.edit),
                      PopupMenuButton(
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                                child: ListTile(
                              onTap: () {
                                CustomBottomSheet(context, int.parse(id));
                              },
                              leading: Icon(Icons.edit_note),
                              title: Text("Edit"),
                            )),
                            PopupMenuItem(
                                child: ListTile(
                              onTap: () {
                                dbref.child(key).child(id).remove();
                              },
                              leading: Icon(Icons.delete_rounded),
                              title: Text("Delete"),
                            )),
                          ];
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        CustomBottomSheet(context, null);
      }),
    );
  }

  Future<void> CustomBottomSheet(BuildContext context, int? taskId) async {
    double mediaHeight = MediaQuery.of(context).size.height;

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                taskId == null
                    ? Text(
                        "Add Task",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    : Text(
                        "Update Task",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                const SizedBox(height: 20),
                CustomTextField(
                  hintText: "Meeting With",
                  obscureText: false,
                  controller: NameController,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: "Topic",
                  obscureText: false,
                  controller: titleController,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: "Description",
                  obscureText: false,
                  controller: descriptionController,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
  onPressed: () async {
    if (NameController.text.isEmpty ||
        titleController.text.isEmpty ||
        descriptionController.text.isEmpty) {
      Mytoast().showToastMessage("Please fill all the fields");
      return;
    }

    if (taskId == null) {
      id++;
      await dbref.child(key).child("$id").set({
        "id": id,
        "MeetingWith": NameController.text,
        "Title": titleController.text,
        "Description": descriptionController.text,
      }).then((value) {
        Mytoast().showToastMessage("Successfully Added");
      }).onError((error, stackTrace) {
        Mytoast().showToastMessage("Error: $error");
      });
    } else {
      await dbref.child(key).child("$taskId").update({
        "id": taskId,
        "MeetingWith": NameController.text,
        "Title": titleController.text,
        "Description": descriptionController.text,
      }).then((value) {
        Mytoast().showToastMessage("Successfully Updated");
      }).onError((error, stackTrace) {
        Mytoast().showToastMessage("Error: $error");
      });
    }

    Navigator.pop(context);
  },
  style: ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 15),
    backgroundColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  child: const Text(
    "Submit",
    style: TextStyle(color: Colors.white),
  ),
)

                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
