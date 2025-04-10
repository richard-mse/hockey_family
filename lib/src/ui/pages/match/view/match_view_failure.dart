part of 'match_view.dart';

class _MatchViewFailure extends StatelessWidget {
  const _MatchViewFailure({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MatchBloc>();
    final state = bloc.state as MatchFailureState;

    return Center(
      child: Text(state.errorMessage),
    );
  }
}
