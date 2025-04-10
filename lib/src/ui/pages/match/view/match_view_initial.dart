part of 'match_view.dart';

class _MatchViewInitial extends StatelessWidget {
  const _MatchViewInitial({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MatchBloc>();
    final state = bloc.state as MatchInitialState;

    return const Center(
      child: Text('Initial State'),
    );
  }
}
