part of 'home_bloc.dart';

sealed class HomeState{
  const HomeState();
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final Set<Game> games;
  const HomeLoadedState(this.games);
}

class HomeSuccessState extends HomeState {}

class HomeFailureState extends HomeState {
  final String errorMessage;

  const HomeFailureState({required this.errorMessage});
}

class HomeNavigateToGameDetailState extends HomeState {
  final Game game;

  const HomeNavigateToGameDetailState(this.game);

  List<Object> get props => [game];
}