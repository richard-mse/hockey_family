part of 'home_view.dart';

class _HomeViewSuccess extends StatelessWidget {
  const _HomeViewSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    final state = bloc.state as HomeSuccessState;

    return const Center(
      child: Text('Success State'),
    );
  }
}
