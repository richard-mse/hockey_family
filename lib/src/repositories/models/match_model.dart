import 'package:hockey_family/src/repositories/models/team_model.dart';

class GameNotification {
  final Team teamA;
  final Team teamB;

  GameNotification({required this.teamA, required this.teamB});
  String get score => "${teamA.name} ${teamA.score} - ${teamB.score} ${teamB.name}";

  GameNotification copy() {
    return GameNotification(
      teamA: Team(name: teamA.name, score: teamA.score),
      teamB: Team(name: teamB.name, score: teamB.score),
    );
  }
}