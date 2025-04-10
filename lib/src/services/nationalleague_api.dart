

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

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

class Game {
  String? gameId;
  String? homeTeamShortName;
  String? homeTeamName;
  String? awayTeamShortName;
  String? awayTeamName;
  String? homeTeamId;
  String? awayTeamId;
  String? vimeoVideoId;
  DateTime date;
  String? status;
  String? baseStatus;
  int? homeTeamResult;
  int? awayTeamResult;
  bool? isOvertime;
  bool? isShootout;
  String? highlightVimeoVideoId;
  bool? isCurrent;
  bool? isCurrentForTeam;
  List<String>? tvPartner;
  String? spectators;
  bool? hasMySports;
  List<String>? referees;
  bool? isExhibition;
  String? homeTeamCoach;
  String? awayTeamCoach;
  int? gameTime;
  bool? showGameTime;

  Game({
    this.gameId,
    this.homeTeamShortName,
    this.homeTeamName,
    this.awayTeamShortName,
    this.awayTeamName,
    this.homeTeamId,
    this.awayTeamId,
    this.vimeoVideoId,
    required this.date,
    this.status,
    this.baseStatus,
    this.homeTeamResult,
    this.awayTeamResult,
    this.isOvertime,
    this.isShootout,
    this.highlightVimeoVideoId,
    this.isCurrent,
    this.isCurrentForTeam,
    this.tvPartner,
    this.spectators,
    this.hasMySports,
    this.referees,
    this.isExhibition,
    this.homeTeamCoach,
    this.awayTeamCoach,
    this.gameTime,
    this.showGameTime,
  });

  // Factory method to create a Game from JSON
  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      gameId: json['gameId'],
      homeTeamShortName: json['homeTeamShortName'],
      homeTeamName: json['homeTeamName'],
      awayTeamShortName: json['awayTeamShortName'],
      awayTeamName: json['awayTeamName'],
      homeTeamId: json['homeTeamId'],
      awayTeamId: json['awayTeamId'],
      vimeoVideoId: json['vimeoVideoId'],
      date: DateTime.parse(json['date']),
      status: json['status'],
      baseStatus: json['baseStatus'],
      homeTeamResult: json['homeTeamResult'],
      awayTeamResult: json['awayTeamResult'],
      isOvertime: json['isOvertime'],
      isShootout: json['isShootout'],
      highlightVimeoVideoId: json['highlightVimeoVideoId'],
      isCurrent: json['isCurrent'],
      isCurrentForTeam: json['isCurrentForTeam'],
      tvPartner: List<String>.from(json['tvPartner']),
      spectators: json['spectators'],
      hasMySports: json['hasMySports'],
      referees: List<String>.from(json['referees']),
      isExhibition: json['isExhibition'],
      homeTeamCoach: json['homeTeamCoach'],
      awayTeamCoach: json['awayTeamCoach'],
      gameTime: json['gameTime'],
      showGameTime: json['showGameTime'],
    );
  }

  // Method to convert Game to JSON (optional, if needed)
  Map<String, dynamic> toJson() {
    return {
      'gameId': gameId,
      'homeTeamShortName': homeTeamShortName,
      'homeTeamName': homeTeamName,
      'awayTeamShortName': awayTeamShortName,
      'awayTeamName': awayTeamName,
      'homeTeamId': homeTeamId,
      'awayTeamId': awayTeamId,
      'vimeoVideoId': vimeoVideoId,
      'date': date.toIso8601String(),
      'status': status,
      'baseStatus': baseStatus,
      'homeTeamResult': homeTeamResult,
      'awayTeamResult': awayTeamResult,
      'isOvertime': isOvertime,
      'isShootout': isShootout,
      'highlightVimeoVideoId': highlightVimeoVideoId,
      'isCurrent': isCurrent,
      'isCurrentForTeam': isCurrentForTeam,
      'tvPartner': tvPartner,
      'spectators': spectators,
      'hasMySports': hasMySports,
      'referees': referees,
      'isExhibition': isExhibition,
      'homeTeamCoach': homeTeamCoach,
      'awayTeamCoach': awayTeamCoach,
      'gameTime': gameTime,
      'showGameTime': showGameTime,
    };
  }
}