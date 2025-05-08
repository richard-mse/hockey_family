import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../repositories/game_repository.dart';
import '../../../../repositories/models/game_model.dart';

part 'games_event.dart';
part 'games_state.dart';

class GamesBloc extends Bloc<GamesEvent, GamesState> {
  final GameRepository repository;

  GamesBloc({required this.repository}) : super(GamesInitialState()) {
    on<GamesInitEvent>(_initEvent);
    on<GamesNavigateToGameDetailEvent>(_onNavigateToGameDetailEvent);
    on<GamesResetNavigationEvent>(_onResetNavigationEvent);
  }

  void _initEvent(GamesInitEvent event, Emitter<GamesState> emit) async {
    emit(GamesLoadingState());
    try {
      final games = repository.getAllGames();
      final teamGames = games.where((game) => game.homeTeamShortName == "GSHC" || game.awayTeamShortName == "GSHC").toSet();
      emit(GamesLoadedState(teamGames));
    } catch (e) {
      emit(GamesFailureState(errorMessage: e.toString()));
    }
  }

  void _onNavigateToGameDetailEvent(
      GamesNavigateToGameDetailEvent event,
      Emitter<GamesState> emit,
      ) {
    emit(GamesNavigateToGameDetailState(event.game));
  }

  void _onResetNavigationEvent(
      GamesResetNavigationEvent event,
      Emitter<GamesState> emit,
      ) async {
    emit(GamesInitialState());
    add(GamesInitEvent());
  }
}
