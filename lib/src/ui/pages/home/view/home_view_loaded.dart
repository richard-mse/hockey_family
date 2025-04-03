part of 'home_view.dart';

class _HomeViewLoaded extends StatelessWidget {
  const _HomeViewLoaded({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    final state = bloc.state as HomeLoadedState;

    return const Center(
      child: Text('Loaded State'),
    );
  }
}
