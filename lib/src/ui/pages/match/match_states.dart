
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

  const MatchState({
    this.status = ReservationsStatus.initial,
    this.reservations = const []
  });

  @override
  List<Object?> get props => [
    status, reservations
  ];

  MatchState copyWith({
    ReservationsStatus? status,
    List<dynamic>? reservations
  }) {
    return MatchState(status: status ?? this.status, reservations: reservations ?? this.reservations);
  }
}