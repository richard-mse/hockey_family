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
    /*
    TODO:
    If the firebase db has a game with id game.gameId AND there is a reservation under the same username as the current logged in user
      change the button to "Remove reservation"
      on click, removes the reservation in the firebase db
    If the firebase db has a game with id game.gameId AND there is already 4 reservations in the firebase db
      grey out the button
      cannot interact with it
    Otherwise
      button "Get Ticket"
      add a new reservation
    */

    if (true) {
      return ElevatedButton(
        onPressed: () {},
        child: Text("Get ticket"),
      );
    } else {
      return ElevatedButton(
          onPressed: () {},
          child: Text("Remove Reservation")
      );
    }
  }
}