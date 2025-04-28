import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hockey_family/src/services/firebase.dart';

import '../bloc/firestore_tests_bloc.dart';

part './firestore_tests_view_initial.dart';
part './firestore_tests_view_loading.dart';
part './firestore_tests_view_loaded.dart';
part './firestore_tests_view_success.dart';
part './firestore_tests_view_failure.dart';

class FirestoreTestsPage extends StatelessWidget {
  const FirestoreTestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FirestoreTestsBloc()..add(FirestoreTestsInitEvent()),
      child: BlocBuilder<FirestoreTestsBloc, FirestoreTestsState>(
        builder: (context, FirestoreTestsState state) => Scaffold(
          appBar: AppBar(
            title: const Text('FirestoreTests Page'),
          ),
          body: _getBody(state, context),
        ),
      ),
    );
  }

  Widget _getBody(FirestoreTestsState state, BuildContext context) {
    if (state is FirestoreTestsInitialState) {
      return const _FirestoreTestsViewInitial();
    } else if (state is FirestoreTestsLoadingState) {
      return const _FirestoreTestsViewLoading();
    } else if (state is FirestoreTestsLoadedState) {
      return const _FirestoreTestsViewLoaded();
    } else if (state is FirestoreTestsSuccessState) {
      return const _FirestoreTestsViewSuccess();
    } else if (state is FirestoreTestsFailureState) {
      return const _FirestoreTestsViewFailure();
    } else {
      return Container(); // Fallback for unexpected states
    }
  }
}
