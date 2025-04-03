import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hockey_family/src/repositories/example_repository.dart';

class AppService with ChangeNotifier {
  bool _initialized = false;

  static final AppService _instance = AppService._internal();
  AppService._internal();
  factory AppService.getInstance() => _instance;

  bool get initialized => _initialized;

  set initialized(bool value) {
    _initialized = value;
    notifyListeners();
  }

  Future<void> onAppStart(BuildContext context) async {
    await ExampleRepository.getInstance().init();
    
    _initialized = true;
    notifyListeners();
  }
}