part of 'firestore_tests_bloc.dart';

sealed class FirestoreTestsState {
  const FirestoreTestsState();
}

class FirestoreTestsInitialState extends FirestoreTestsState {}

class FirestoreTestsLoadingState extends FirestoreTestsState {}

class FirestoreTestsLoadedState extends FirestoreTestsState {
  final List<Map<String, dynamic>> users;

  const FirestoreTestsLoadedState(this.users);
}

class FirestoreTestsSuccessState extends FirestoreTestsState {}

class FirestoreTestsFailureState extends FirestoreTestsState {
  final String errorMessage;

  const FirestoreTestsFailureState({required this.errorMessage});
}
