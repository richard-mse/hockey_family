part of 'firestore_tests_view.dart';

class _FirestoreTestsViewLoaded extends StatelessWidget {
  const _FirestoreTestsViewLoaded({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FirestoreTestsBloc>();
    final state = bloc.state as FirestoreTestsLoadedState;

    return ListView.builder(
      itemCount: state.users.length,
      itemBuilder: (context, index) {
        var user = state.users[index];
        var username = user["Username"] ?? 'No Username';
        return ListTile(
          title: Text("User index : ${index.toString()}"),
          subtitle: Text(username.toString()),
        );
      },
    );
  }
}