import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hockey_family/src/services/nationalleague_api.dart';

part 'match_event.dart';
part 'match_state.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  MatchBloc() : super(MatchInitialState()) {
    on<MatchInitEvent>(_initEvent);
  }

  void _initEvent(MatchInitEvent event, Emitter<MatchState> emit) async {
    emit(MatchLoadingState());

    try {
      NationalLeagueAPI api = NationalLeagueAPI();
      final games = await api.fetchGames();
      emit(MatchLoadedState(games));
    } catch(e) {
      emit(MatchFailureState(errorMessage: e.toString()));
    }
  }
}
