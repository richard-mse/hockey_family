part of 'games_bloc.dart';

sealed class GamesState{
  const GamesState();
}

class GamesInitialState extends GamesState {}

class GamesLoadingState extends GamesState {}

class GamesLoadedState extends GamesState {
  final Set<Game> games;
  const GamesLoadedState(this.games);
}

class GamesSuccessState extends GamesState {}

class GamesFailureState extends GamesState {
  final String errorMessage;

  const GamesFailureState({required this.errorMessage});
}

class GamesNavigateToGameDetailState extends GamesState {
  final Game game;

  const GamesNavigateToGameDetailState(this.game);

  List<Object> get props => [game];
}