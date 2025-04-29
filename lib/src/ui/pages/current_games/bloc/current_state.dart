part of 'current_bloc.dart';

sealed class CurrentState{
  const CurrentState();
}

class CurrentInitialState extends CurrentState {}

class CurrentLoadingState extends CurrentState {}

class CurrentLoadedState extends CurrentState {
  final Set<Game> games;
  const CurrentLoadedState(this.games);
}

class CurrentSuccessState extends CurrentState {}

class CurrentFailureState extends CurrentState {
  final String errorMessage;

  const CurrentFailureState({required this.errorMessage});
}

class CurrentNavigateToGameDetailState extends CurrentState {
  final Game game;

  const CurrentNavigateToGameDetailState(this.game);

  List<Object> get props => [game];
}