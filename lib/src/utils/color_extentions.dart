import 'package:flutter/material.dart';

extension ColorExtension on Color {
  String toHexStringNoAlpha() {
    return "#${this.red.toRadixString(16).padLeft(2, '0')}${this.green.toRadixString(16).padLeft(2, '0')}${this.blue.toRadixString(16).padLeft(2, '0')}".toUpperCase();
  }

  Color getTextContrastColor() {
    return this.computeLuminance() > 0.88 ? Colors.grey.shade900 : Colors.white;
  }
}