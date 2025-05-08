
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hockey_family/src/repositories/models/game_model.dart';
import 'package:hockey_family/src/services/firebase.dart';
import 'package:hockey_family/src/ui/pages/match/match_states.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MatchCubit extends Cubit<MatchState> {
  final Game game;

  MatchCubit(this.game) : super(MatchState());

  Future<void> loadReservations() async {
    emit(state.copyWith(status: ReservationsStatus.loading));
    try {
      final reservations = await FireStoreService().getGameReservations(game.gameId!);
      final prefs = await SharedPreferences.getInstance();
      final user = prefs.getString("userName");
      emit(state.copyWith(status: ReservationsStatus.loaded, reservations: reservations, user: user));
    } catch (_) {
      throw UnimplementedError("");
    }
  }

  Future<void> setReservation() async {
    emit(state.copyWith(status: ReservationsStatus.loading));
    try {
      await FireStoreService().setGameReservation(game.gameId!);
      final reservations = await FireStoreService().getGameReservations(game.gameId!);
      final prefs = await SharedPreferences.getInstance();
      final user = prefs.getString("userName");
      emit(state.copyWith(status: ReservationsStatus.loaded, reservations: reservations, user: user));
    } catch (_) {
      throw UnimplementedError("");
    }
  }

  Future<void> removeReservation() async {
    emit(state.copyWith(status: ReservationsStatus.loading));
    try {
      await FireStoreService().removeGameReservation(game.gameId!);
      final reservations = await FireStoreService().getGameReservations(game.gameId!);
      final prefs = await SharedPreferences.getInstance();
      final user = prefs.getString("userName");
      emit(state.copyWith(status: ReservationsStatus.loaded, reservations: reservations, user: user));
    } catch (_) {
      throw UnimplementedError("");
    }
  }

}