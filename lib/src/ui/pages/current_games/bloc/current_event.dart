part of 'current_bloc.dart';

sealed class CurrentEvent{
  const CurrentEvent();
}

class CurrentInitEvent extends CurrentEvent {}

class CurrentNavigateToGameDetailEvent extends CurrentEvent {
  final Game game;
  const CurrentNavigateToGameDetailEvent(this.game);

  List<Object> get props => [game];
}

class CurrentResetNavigationEvent extends CurrentEvent {
  const CurrentResetNavigationEvent();

  List<Object> get props => [];
}