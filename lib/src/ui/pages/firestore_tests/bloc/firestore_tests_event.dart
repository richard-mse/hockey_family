part of 'firestore_tests_bloc.dart';

sealed class FirestoreTestsEvent {
  const FirestoreTestsEvent();
}

class FirestoreTestsInitEvent extends FirestoreTestsEvent {}
