

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../repositories/models/game_model.dart';

class NationalLeagueAPI {
  static final NationalLeagueAPI _nationalLeagueAPI = NationalLeagueAPI.internal();

  factory NationalLeagueAPI() {
    return _nationalLeagueAPI;
  }

  NationalLeagueAPI.internal();

  Future<Set<Game>> fetchGames() async {
    try {
      final response = await http.get(
        Uri.parse('https://nationalleague.ch/api/games?lang=fr-CH'),
      );

      if (response.statusCode == 200) {
        var parsedJson = jsonDecode(response.body);
        var games = <Game>{};
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

