part of 'games_view.dart';

class _GamesViewFailure extends StatelessWidget {
  const _GamesViewFailure({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<GamesBloc>();
    final state = bloc.state as GamesFailureState;

    return Center(
      child: Text(state.errorMessage),
    );
  }
}
