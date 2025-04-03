part of 'firestore_tests_view.dart';

class _FirestoreTestsViewLoaded extends StatelessWidget {
  const _FirestoreTestsViewLoaded({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FirestoreTestsBloc>();
    final state = bloc.state as FirestoreTestsLoadedState;

    return ListView.builder(
      itemCount: state.games.length,
      itemBuilder: (context, index) {
        var game = state.games[index];
        var reservations = game["Reservations"] ?? 'No Reservation';
        return ListTile(
          title: Text("Game index : ${index.toString()}"),
          subtitle: Text(reservations.toString()),
        );
      },
    );
  }
}