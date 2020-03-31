import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorBox extends ChangeNotifier {
  Color color = Colors.red;

  setColor(Color newColor) {
    color = newColor;
    notifyListeners();
  }
}
