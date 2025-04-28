part of 'firestore_tests_view.dart';

class _FirestoreTestsViewFailure extends StatelessWidget {
  const _FirestoreTestsViewFailure({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FirestoreTestsBloc>();
    final state = bloc.state as FirestoreTestsFailureState;

    return Center(
      child: Text(state.errorMessage),
    );
  }
}
