
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class Utils {

  // hex #f1f1f1;
  static Color color(String hex) {
    if (hex.startsWith('#')) {
      return Color(int.parse('FF' + hex.substring(1), radix: 16));
    }
  }


  static getClientSize(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return screenSize;
  }

}