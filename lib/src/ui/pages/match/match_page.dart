import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hockey_family/src/services/firebase.dart';
import 'package:hockey_family/src/ui/pages/match/match_cubit.dart';

import '../../../repositories/models/game_model.dart';
import 'match_states.dart';

class MatchPage extends StatelessWidget {
  final Game game;
  const MatchPage({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
        create: (context) => MatchCubit(game)..loadReservations(),
        child: MatchScreen(game: game,),
    );
  }
}

class MatchScreen extends StatelessWidget {
  final Game game;
  const MatchScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Game Result"),
          centerTitle: true,
        ),
        body: BlocBuilder<MatchCubit, MatchState>(
            builder: (context, state) {
              if (state.status == ReservationsStatus.loading) {
                return Column(
                  children: [
                    ScoreSection(game: game),
                    Center(child: CircularProgressIndicator(),)
                  ],
                );
              } else if (state.status == ReservationsStatus.loaded) {
                return Column(
                  children: [
                    ScoreSection(game: game),
                    MatchInfoSection(game: game, reservations: state.reservations,)
                  ],
                );
              }
              return const SizedBox.shrink();
            }
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


// class GameDetailPage extends StatefulWidget {
//   final Game game;
//
//   const GameDetailPage({super.key, required this.game});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Game Result"),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           ScoreSection(game: game),
//           MatchInfoSection(game: game)
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         child: Icon(Icons.keyboard_return),
//       ),
//     );
//   }
// }

class ScoreSection extends StatelessWidget {
  const ScoreSection({super.key, required this.game});

  final Game game;

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
  const MatchInfoSection({super.key, required this.game, required this.reservations});

  final Game game;
  final List<dynamic> reservations;

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
    FireStoreService().getGameReservations(game.gameId!);

    if (true) {
      return ElevatedButton(
        onPressed: () {FireStoreService().setGameReservation(game.gameId!);},
        child: Text(reservations.toString()),
      );
    } else {
      return ElevatedButton(
          onPressed: () {},
          child: Text("Remove Reservation")
      );
    }
  }
}

