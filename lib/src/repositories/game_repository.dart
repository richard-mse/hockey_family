import '../services/game_api.dart';
import 'models/game_model.dart';

final class GameRepository {
  static GameRepository? _instance;

  final GameApi _api;
  Set<Game> _cachedGames = {};

  GameRepository._internal(this._api);

  /// Factory pour créer le singleton
  factory GameRepository.getInstance(GameApi api) {
    _instance ??= GameRepository._internal(api);
    return _instance!;
  }

  /// Getter sécurisé
  static GameRepository get instance {
    if (_instance == null) {
      throw Exception('GameRepository must be initialized first using getInstance(api)');
    }
    return _instance!;
  }

  /// Initialise et récupère les données de l'API
  Future<void> init() async {
    _cachedGames = await _api.getGames();
  }

  /// Retourne tous les matchs
  Set<Game> getAllGames() {
    return _cachedGames;
  }

  /// Retourne les matchs pour une date précise (même jour)
  List<Game> getGamesForDay(DateTime day) {
    return _cachedGames.where((game) {
      final gameDate = DateTime.utc(game.date.year, game.date.month, game.date.day);
      final targetDate = DateTime.utc(day.year, day.month, day.day);
      return gameDate == targetDate;
    }).toList();
  }
}
