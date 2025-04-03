part of 'home_view.dart';

class _HomeViewFailure extends StatelessWidget {
  const _HomeViewFailure({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    final state = bloc.state as HomeFailureState;

    return Center(
      child: Text(state.errorMessage),
    );
  }
}
