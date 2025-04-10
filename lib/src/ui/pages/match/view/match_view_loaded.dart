part of 'match_view.dart';

class _MatchViewLoaded extends StatelessWidget {
  const _MatchViewLoaded({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MatchBloc>();
    final state = bloc.state as MatchLoadedState;
    state.games.forEach((game) => {
      print(game.gameId)
    });

    return const Center(
      child: Text('Loaded State'),
    );
  }
}
