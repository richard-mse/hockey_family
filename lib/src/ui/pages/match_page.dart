import 'package:flutter/material.dart';

import '../../repositories/models/game_model.dart';

class GameDetailPage extends StatelessWidget {
  final Game game;

  const GameDetailPage({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${game.homeTeamShortName} vs ${game.awayTeamShortName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text('Date du match : ${game.date}'),
      ),
    );
  }
}
