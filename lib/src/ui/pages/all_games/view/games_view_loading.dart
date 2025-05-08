part of 'games_view.dart';

class _GamesViewLoading extends StatelessWidget {
  const _GamesViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<GamesBloc>();
    final state = bloc.state as GamesLoadingState;

    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
