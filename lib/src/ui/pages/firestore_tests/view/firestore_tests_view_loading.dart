part of 'firestore_tests_view.dart';

class _FirestoreTestsViewLoading extends StatelessWidget {
  const _FirestoreTestsViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FirestoreTestsBloc>();
    final state = bloc.state as FirestoreTestsLoadingState;

    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
