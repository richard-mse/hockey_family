import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hockey_family/src/ui/pages/match/match_cubit.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../l10n/gen/app_localizations.dart';
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
          title: Text(AppLocalizations.of(context)!.title_game_result_page),
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
                    MatchInfoSection(game: game, reservations: state.reservations, user: state.user,),
                    GameQrCode(
                      user: state.user,
                      reservations: state.reservations,
                    ),
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
        child: Text(AppLocalizations.of(context)!.btn_reservation_full),

      );
    } else if (reservations.length < 4 && !reservations.contains(user)) {
      return ElevatedButton(
          onPressed: () {context.read<MatchCubit>().setReservation();},
          child: Text(AppLocalizations.of(context)!.btn_reservation_empty)
      );
    } else {
      return ElevatedButton(
          onPressed: () {context.read<MatchCubit>().removeReservation();},
          child: Text(AppLocalizations.of(context)!.btn_reservation_remove)
      );
    }
  }
}

class GameQrCode extends StatefulWidget {
  final String user;
  final List<dynamic> reservations;

  const GameQrCode({super.key, required this.user, required this.reservations});

  @override
  State<GameQrCode> createState() => _GameQrCodeState();
}

class _GameQrCodeState extends State<GameQrCode> {
  bool get userHasReservation => widget.reservations.contains(widget.user);

  @override
  Widget build(BuildContext context) {
    if (!userHasReservation) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        children: [
          const Text(
            "Votre billet QR",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          QrImageView(
            data: "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
            version: QrVersions.auto,
            size: 200.0,
            backgroundColor: Colors.white,
            gapless: false,
          ),
        ],
      ),
    );
  }
}