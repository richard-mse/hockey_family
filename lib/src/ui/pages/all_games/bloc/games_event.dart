part of 'games_bloc.dart';

sealed class GamesEvent{
  const GamesEvent();
}

class GamesInitEvent extends GamesEvent {}

class GamesNavigateToGameDetailEvent extends GamesEvent {
  final Game game;
  const GamesNavigateToGameDetailEvent(this.game);

  List<Object> get props => [game];
}

class GamesResetNavigationEvent extends GamesEvent {
  const GamesResetNavigationEvent();

  List<Object> get props => [];
}