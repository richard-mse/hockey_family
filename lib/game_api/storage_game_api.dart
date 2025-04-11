import 'dart:convert';
import 'package:http/http.dart' as http;
import '../src/repositories/models/game_model.dart';
import 'game_api.dart';

class StorageGameApi extends GameApi {
  @override
  Future<Set<Game>> getGames() async {
    try {
      final response = await http.get(
        Uri.parse('https://nationalleague.ch/api/games?lang=fr-CH'),
      );

      if (response.statusCode == 200) {
        final parsedJson = jsonDecode(response.body);
        final games = <Game>{};

        for (var game in parsedJson) {
          games.add(Game.fromJson(game));
        }

        return games;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error during GET request: $e');
    }
  }
}
