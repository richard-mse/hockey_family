part of 'current_view.dart';

class _CurrentViewInitial extends StatelessWidget {
  const _CurrentViewInitial({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CurrentBloc>();
    final state = bloc.state as CurrentInitialState;

    return const Center(
      child: Text('Initial State'),
    );
  }
}
