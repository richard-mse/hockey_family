import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../repositories/game_repository.dart';
import '../../../../repositories/models/game_model.dart';

part 'current_event.dart';
part 'current_state.dart';

class CurrentBloc extends Bloc<CurrentEvent, CurrentState> {
  final GameRepository repository;

  CurrentBloc({required this.repository}) : super(CurrentInitialState()) {
    on<CurrentInitEvent>(_initEvent);
    on<CurrentNavigateToGameDetailEvent>(_onNavigateToGameDetailEvent);
    on<CurrentResetNavigationEvent>(_onResetNavigationEvent);
  }

  void _initEvent(CurrentInitEvent event, Emitter<CurrentState> emit) async {
    emit(CurrentLoadingState());
    try {
      final games = repository.getAllGames();
      final currentGames = games.where((game) => game.isCurrent!).toSet();
      emit(CurrentLoadedState(currentGames));
    } catch (e) {
      emit(CurrentFailureState(errorMessage: e.toString()));
    }
  }

  void _onNavigateToGameDetailEvent(
      CurrentNavigateToGameDetailEvent event,
      Emitter<CurrentState> emit,
      ) {
    emit(CurrentNavigateToGameDetailState(event.game));
  }

  void _onResetNavigationEvent(
      CurrentResetNavigationEvent event,
      Emitter<CurrentState> emit,
      ) async {
    emit(CurrentInitialState());
    add(CurrentInitEvent());
  }
}
