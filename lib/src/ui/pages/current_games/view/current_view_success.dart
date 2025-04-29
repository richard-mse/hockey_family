part of 'current_view.dart';

class _CurrentViewSuccess extends StatelessWidget {
  const _CurrentViewSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CurrentBloc>();
    final state = bloc.state as CurrentSuccessState;

    return const Center(
      child: Text('Success State'),
    );
  }
}
