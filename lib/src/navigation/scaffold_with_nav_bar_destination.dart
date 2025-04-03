import 'package:flutter/material.dart';

class ScaffoldWithNavBarDestination extends NavigationDestination {
  const ScaffoldWithNavBarDestination({required this.initialLocation, required super.icon, required super.label});
  final String initialLocation;
}
