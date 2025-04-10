part of 'match_bloc.dart';

sealed class MatchEvent {
  const MatchEvent();
}

class MatchInitEvent extends MatchEvent {}
