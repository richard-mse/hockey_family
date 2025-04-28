import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hockey_family/src/services/firebase.dart';

part 'firestore_tests_event.dart';
part 'firestore_tests_state.dart';

class FirestoreTestsBloc extends Bloc<FirestoreTestsEvent, FirestoreTestsState> {
  FirestoreTestsBloc() : super(FirestoreTestsInitialState()) {
    on<FirestoreTestsInitEvent>(_initEvent);
  }

  void _initEvent(FirestoreTestsInitEvent event, Emitter<FirestoreTestsState> emit) async {
    emit(FirestoreTestsLoadingState());
    try {
      FirestoreService fsService = FirestoreService();
      final users = await fsService.getUsers();
      emit(FirestoreTestsLoadedState(users));
    } catch (e) {
      emit(FirestoreTestsFailureState(errorMessage: e.toString()));
    }
  }
}
