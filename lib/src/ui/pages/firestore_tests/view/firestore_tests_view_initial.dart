part of 'firestore_tests_view.dart';

class _FirestoreTestsViewInitial extends StatelessWidget {
  const _FirestoreTestsViewInitial({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FirestoreTestsBloc>();
    final state = bloc.state as FirestoreTestsInitialState;

    return const Center(
      child: Text('Initial State'),
    );
  }
}
