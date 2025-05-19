import 'dart:async';
import 'dart:math';

import '../repositories/models/match_model.dart';
import '../repositories/models/team_model.dart';
import '../utils/notification_helper.dart';

class GoalWatcherService {
  GameNotification currentGameNotification = GameNotification(
    teamA: Team(name: "GSHC", score: 0),
    teamB: Team(name: "ZSC", score: 0),
  );

  GameNotification? previousGameNotification;
  Timer? _timer;
  final Random _random = Random();

  void startPolling({Duration interval = const Duration(seconds: 30)}) {
    previousGameNotification = currentGameNotification.copy();

    _timer = Timer.periodic(interval, (_) async {
      _simulateGoal();

      if (_hasChanged()) {
        await showGoalNotification(currentGameNotification.score);
      }
      previousGameNotification = currentGameNotification.copy();
    });
  }

  void stopPolling() {
    _timer?.cancel();
  }

  void _simulateGoal() {
    int chance = _random.nextInt(3);

    if (chance == 0) {
      currentGameNotification.teamA.score += 1;
    } else if (chance == 1) {
      currentGameNotification.teamB.score += 1;
    }
  }

  bool _hasChanged() {
    return currentGameNotification.teamA.score != previousGameNotification!.teamA.score ||
        currentGameNotification.teamB.score != previousGameNotification!.teamB.score;
  }
}