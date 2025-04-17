part of 'match_view.dart';

class _MatchViewLoaded extends StatelessWidget {
  const _MatchViewLoaded({super.key});

  String getLogoPath(String code) {
    return "assets/logos/$code.png";
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MatchBloc>();
    final state = bloc.state as MatchLoadedState;

    final gshcGames = state.games.where((game) => game.homeTeamShortName == "GSHC");

    final exampleGame = gshcGames.first;

    return Scaffold(
      body: Column(
        children: [
          ScoreSection(game: exampleGame),
          MatchInfoSection(game: exampleGame)
        ],
      )
    );
  }
}

class ScoreSection extends StatelessWidget {
  const ScoreSection({super.key, required this.game});

  final Game game;

  Widget Score(int result) {
    return Text(
      result.toString(),
      style: TextStyle(
          fontSize: 20
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            spacing: 50,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Image(image: AssetImage("assets/logos/${game.homeTeamShortName}.png")),
              ),
              Score(game.homeTeamResult!),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100.0),
            child: Text(
              "VS",
              style: TextStyle(fontSize: 50),
            ),
          ),
          Column(
            spacing: 50,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Image(image: AssetImage("assets/logos/${game.awayTeamShortName}.png")),
              ),
              Score(game.awayTeamResult!)
            ],
          ),
        ],
      ),
    );
  }
}

class MatchInfoSection extends StatelessWidget {
  const MatchInfoSection({super.key, required this.game});

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Text("");
  }
}