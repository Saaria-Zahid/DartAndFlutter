

import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier{
  int _counter = 0;

  void Increment(){
    _counter++;
    notifyListeners();
  }

  int getData() => _counter;

  void Restart(){
    _counter = 0;
    notifyListeners();
  }
}