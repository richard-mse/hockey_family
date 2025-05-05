
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hockey_family/src/repositories/models/game_model.dart';
import 'package:hockey_family/src/services/firebase.dart';
import 'package:hockey_family/src/ui/pages/match/match_states.dart';

class MatchCubit extends Cubit<MatchState> {
  final Game game;

  MatchCubit(this.game) : super(MatchState());

  Future<void> loadReservations() async {
    emit(state.copyWith(status: ReservationsStatus.loading));
    try {
      final reservations = await FireStoreService().getGameReservations(game.gameId!);
      emit(state.copyWith(status: ReservationsStatus.loaded, reservations: reservations));
    } catch (_) {
      throw UnimplementedError("");
    }
  }
}