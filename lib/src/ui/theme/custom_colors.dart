import 'package:flutter/material.dart';

final class CustomColors extends ThemeExtension<CustomColors> {
  final Color primaryColor;
  final Color lightPrimaryColor;
  final Color secondaryColor;
  final Color lightSecondaryColor;

  const CustomColors({
    required this.primaryColor,
    required this.lightPrimaryColor,
    required this.secondaryColor,
    required this.lightSecondaryColor,
  });

  @override
  ThemeExtension<CustomColors> copyWith({
    Color? primaryColor,
    Color? lightPrimaryColor,
    Color? secondaryColor,
    Color? lightSecondaryColor,
  }) {
    return CustomColors(
      primaryColor: primaryColor ?? this.primaryColor,
      lightPrimaryColor: lightPrimaryColor ?? this.lightPrimaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      lightSecondaryColor: lightSecondaryColor ?? this.lightSecondaryColor,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }

    return CustomColors(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      lightPrimaryColor: Color.lerp(lightPrimaryColor, other.lightPrimaryColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      lightSecondaryColor: Color.lerp(lightSecondaryColor, other.lightSecondaryColor, t)!,
    );
  }
}
