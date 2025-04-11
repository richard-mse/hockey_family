import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hockey_family/src/repositories/game_repository.dart';
import '../../game_api/storage_game_api.dart';

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
    final api = StorageGameApi();
    final repo = GameRepository.getInstance(api);
    await repo.init();
    _initialized = true;
    notifyListeners();
  }
}
