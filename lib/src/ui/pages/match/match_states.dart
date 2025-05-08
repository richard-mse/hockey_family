
import 'package:equatable/equatable.dart';

import '../../../repositories/models/game_model.dart';

enum ReservationsStatus {
  initial,
  loading,
  loaded
}

class MatchState extends Equatable {

  final List<dynamic> reservations;
  final ReservationsStatus status;
  final String user;

  const MatchState({
    this.status = ReservationsStatus.initial,
    this.reservations = const [],
    this.user = ""
  });

  @override
  List<Object?> get props => [
    status, reservations, user
  ];

  MatchState copyWith({
    ReservationsStatus? status,
    List<dynamic>? reservations,
    String? user
  }) {
    return MatchState(status: status ?? this.status, reservations: reservations ?? this.reservations, user: user ?? this.user);
  }
}