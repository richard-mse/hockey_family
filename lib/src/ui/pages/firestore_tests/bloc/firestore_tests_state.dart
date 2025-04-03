part of 'firestore_tests_bloc.dart';

sealed class FirestoreTestsState {
  const FirestoreTestsState();
}

class FirestoreTestsInitialState extends FirestoreTestsState {}

class FirestoreTestsLoadingState extends FirestoreTestsState {}

class FirestoreTestsLoadedState extends FirestoreTestsState {
  final games;

  const FirestoreTestsLoadedState(this.games);
}

class FirestoreTestsSuccessState extends FirestoreTestsState {}

class FirestoreTestsFailureState extends FirestoreTestsState {
  final String errorMessage;

  const FirestoreTestsFailureState({required this.errorMessage});
}
