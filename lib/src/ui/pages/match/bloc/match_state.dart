part of 'match_bloc.dart';

sealed class MatchState {
  const MatchState();
}

class MatchInitialState extends MatchState {}

class MatchLoadingState extends MatchState {}

class MatchLoadedState extends MatchState {
  final Set<Game> games;

  const MatchLoadedState(this.games);
}

class MatchSuccessState extends MatchState {}

class MatchFailureState extends MatchState {
  final String errorMessage;

  const MatchFailureState({required this.errorMessage});
}
