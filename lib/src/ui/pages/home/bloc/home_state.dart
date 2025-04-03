part of 'home_bloc.dart';

sealed class HomeState {
  const HomeState();
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {}

class HomeSuccessState extends HomeState {}

class HomeFailureState extends HomeState {
  final String errorMessage;

  const HomeFailureState({required this.errorMessage});
}
