part of 'games_view.dart';

class _GamesViewInitial extends StatelessWidget {
  const _GamesViewInitial({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<GamesBloc>();
    final state = bloc.state as GamesInitialState;

    return const Center(
      child: Text('Initial State'),
    );
  }
}
