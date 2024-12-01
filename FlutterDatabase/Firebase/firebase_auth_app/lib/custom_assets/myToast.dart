import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Mytoast{
  void showToastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
    );
  }
}