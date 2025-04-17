part of 'match_view.dart';

class _MatchViewLoaded extends StatelessWidget {
  const _MatchViewLoaded({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MatchBloc>();
    final state = bloc.state as MatchLoadedState;
<<<<<<< HEAD
    // state.games.forEach((game) => {
    //   print(game.gameId)
    // });
=======
>>>>>>> 0931220 (feat: able to show an image)

    var gshc_games = state.games.where((game) => game.homeTeamShortName == "GSHC");

    var example_game = gshc_games.first;

    print(example_game.homeTeamShortName);
    print(example_game.awayTeamShortName);

    
    return const Center(
      child: Image(image: AssetImage("logos/GSHC.png")),
    );
  }
}
