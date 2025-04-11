part of 'home_bloc.dart';

sealed class HomeEvent{
  const HomeEvent();
}

class HomeInitEvent extends HomeEvent {}

class HomeNavigateToGameDetailEvent extends HomeEvent {
  final Game game;
  const HomeNavigateToGameDetailEvent(this.game);

  List<Object> get props => [game];
}

class HomeResetNavigationEvent extends HomeEvent {
  const HomeResetNavigationEvent();

  List<Object> get props => [];
}