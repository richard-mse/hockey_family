part of 'current_view.dart';

class _CurrentViewFailure extends StatelessWidget {
  const _CurrentViewFailure({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CurrentBloc>();
    final state = bloc.state as CurrentFailureState;

    return Center(
      child: Text(state.errorMessage),
    );
  }
}
