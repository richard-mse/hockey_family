part of 'games_view.dart';

class _GamesViewSuccess extends StatelessWidget {
  const _GamesViewSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<GamesBloc>();
    final state = bloc.state as GamesSuccessState;

    return const Center(
      child: Text('Success State'),
    );
  }
}
