part of 'firestore_tests_view.dart';

class _FirestoreTestsViewSuccess extends StatelessWidget {
  const _FirestoreTestsViewSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FirestoreTestsBloc>();
    final state = bloc.state as FirestoreTestsSuccessState;

    return const Center(
      child: Text('Success State'),
    );
  }
}
