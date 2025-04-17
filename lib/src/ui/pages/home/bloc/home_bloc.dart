import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../repositories/game_repository.dart';
import '../../../../repositories/models/game_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GameRepository repository;

  HomeBloc({required this.repository}) : super(HomeInitialState()) {
    on<HomeInitEvent>(_initEvent);
    on<HomeNavigateToGameDetailEvent>(_onNavigateToGameDetailEvent);
    on<HomeResetNavigationEvent>(_onResetNavigationEvent);
  }

  void _initEvent(HomeInitEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      final games = repository.getAllGames();
      emit(HomeLoadedState(games));
    } catch (e) {
      emit(HomeFailureState(errorMessage: e.toString()));
    }
  }

  void _onNavigateToGameDetailEvent(
      HomeNavigateToGameDetailEvent event,
      Emitter<HomeState> emit,
      ) {
    emit(HomeNavigateToGameDetailState(event.game));
  }

  void _onResetNavigationEvent(
      HomeResetNavigationEvent event,
      Emitter<HomeState> emit,
      ) async {
    emit(HomeInitialState());
    add(HomeInitEvent());
  }
}
