import '../repositories/models/game_model.dart';

abstract class GameApi {
  Future<Set<Game>> getGames();
}

class GameNotFoundException implements Exception {}