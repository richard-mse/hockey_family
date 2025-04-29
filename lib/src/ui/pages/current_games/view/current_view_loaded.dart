part of 'current_view.dart';

class _CurrentViewLoaded extends StatelessWidget {

  const _CurrentViewLoaded({super.key});

  @override
  Widget build(BuildContext context) {

    final bloc = context.read<CurrentBloc>();
    final state = bloc.state as CurrentLoadedState;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: _GamePanel(game: state.games.first),
      )
    );
  }
}

class _GamePanel extends StatelessWidget {
  const _GamePanel({super.key, required this.game});

  final Game game;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => GameDetailPage(game: game),
        ),
      ),
      child: Container(
        width: double.infinity, // Full screen width
        height: 80,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(5)
        ),
        child: Center(
            child: Text("a")
        ),
      ),
    );
  }
}