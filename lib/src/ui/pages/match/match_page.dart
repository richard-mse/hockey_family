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
                    MatchInfoSection(game: game, reservations: state.reservations, user: state.user,)
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
  const MatchInfoSection({super.key, required this.game, required this.reservations, required this.user});

  final Game game;
  final List<dynamic> reservations;
  final String user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReservationButton(game: game, reservations: reservations, user: user,),
        Text(reservations.toString())
      ],
    );
  }
}

class ReservationButton extends StatelessWidget {

  const ReservationButton({super.key, required this.game, required this.reservations, required this.user});

  final Game game;
  final List<dynamic> reservations;
  final String user;

  @override
  Widget build(BuildContext context) {
    if (reservations.length >= 4) {
      return ElevatedButton(
        onPressed: null,
        child: Text("Match full"),

      );
    } else if (reservations.length < 4 && !reservations.contains(user)) {
      return ElevatedButton(
          onPressed: () {MatchCubit(game).setReservation();},
          child: Text("Reserve ticket")
      );
    } else {
      return ElevatedButton(
          onPressed: () {MatchCubit(game).removeReservation();},
          child: Text("Remove reservation")
      );
    }
  }
}