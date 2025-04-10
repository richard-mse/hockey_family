part of 'match_view.dart';

class _MatchViewLoading extends StatelessWidget {
  const _MatchViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MatchBloc>();
    final state = bloc.state as MatchLoadingState;

    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
