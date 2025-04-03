import 'package:flutter/material.dart';
import 'package:hockey_family/src/ui/theme/custom_colors.dart';

class CustomTheme {
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      extensions: const <ThemeExtension<dynamic>>[
        CustomColors(
          primaryColor: Colors.blue,
          lightPrimaryColor: Colors.blueAccent,
          secondaryColor: Colors.green,
          lightSecondaryColor: Colors.greenAccent,
        )
      ],
    );
  }

  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      extensions: const <ThemeExtension<dynamic>>[
        CustomColors(
          primaryColor: Colors.deepOrange,
          lightPrimaryColor: Colors.deepOrangeAccent,
          secondaryColor: Colors.deepPurple,
          lightSecondaryColor: Colors.deepPurpleAccent,
        )
      ],
    );
  }
}