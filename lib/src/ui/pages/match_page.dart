import 'package:flutter/material.dart';

import '../../repositories/models/game_model.dart';

class GameDetailPage extends StatelessWidget {
  final Game game;

  const GameDetailPage({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Game Result"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ScoreSection(game: game),
          MatchInfoSection(game: game)
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
        child: Icon(Icons.keyboard_return),
      ),
    );
  }
}

class ScoreSection extends StatelessWidget {
  const ScoreSection({super.key, required this.game});

  final Game game;

  Widget Score(int result) {
    return Text(
      result.toString(),
      style: TextStyle(
          fontSize: 20
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTeamColumn(game.homeTeamShortName!, game.homeTeamResult!),
            Text(
              "vs",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            _buildTeamColumn(game.awayTeamShortName!, game.awayTeamResult!),
          ],
        ),
      ),
    );
    //  return Padding(
    //   padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 50.0),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: <Widget>[
    //       Column(
    //         spacing: 50,
    //         children: [
    //           SizedBox(
    //             width: 100,
    //             height: 100,
    //             child: Image(image: AssetImage("assets/logos/${game.homeTeamShortName}.png")),
    //           ),
    //           Score(game.homeTeamResult!),
    //         ],
    //       ),
    //       Padding(
    //         padding: EdgeInsets.symmetric(horizontal: 100.0),
    //         child: Text(
    //           "VS",
    //           style: TextStyle(fontSize: 50),
    //         ),
    //       ),
    //       Column(
    //         spacing: 50,
    //         children: [
    //           SizedBox(
    //             width: 100,
    //             height: 100,
    //             child: Image(image: AssetImage("assets/logos/${game.awayTeamShortName}.png")),
    //           ),
    //           Score(game.awayTeamResult!),
    //         ],
    //       ),
    //     ],
    //   ),
  }

  Widget _buildTeamColumn(String name, int score) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image(image: AssetImage("assets/logos/$name.png"), height: 80, width: 80,),
        SizedBox(height: 10),
        Text(
          name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 5),
        Text(
          score.toString(),
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class MatchInfoSection extends StatelessWidget {
  const MatchInfoSection({super.key, required this.game});

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Text("");
  }
}