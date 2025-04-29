part of 'current_view.dart';

class _CurrentViewLoading extends StatelessWidget {
  const _CurrentViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CurrentBloc>();
    final state = bloc.state as CurrentLoadingState;

    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
