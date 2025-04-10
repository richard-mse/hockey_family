part of 'match_view.dart';

class _MatchViewSuccess extends StatelessWidget {
  const _MatchViewSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MatchBloc>();
    final state = bloc.state as MatchSuccessState;

    return const Center(
      child: Text('Success State'),
    );
  }
}
