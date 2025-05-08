part of 'games_view.dart';

class _GamesViewLoaded extends StatelessWidget {

  const _GamesViewLoaded({super.key});

  @override
  Widget build(BuildContext context) {

    final bloc = context.read<GamesBloc>();
    final state = bloc.state as GamesLoadedState;

    final cards = <Widget>[];

    var month = -1;
    for (var game in state.games) {
      if (game.date.month != month) {
        month = game.date.month;
        cards.add(MonthItem(monthNumber: month));
      }
      cards.add(_GamePanel(game: game));
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: cards,
        )
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
          builder: (_) => MatchPage(game: game),
        ),
      ),
      child: Container(
        width: double.infinity, // full width
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 1.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTeamColumn(game.homeTeamShortName!, game.homeTeamResult!),
            Text(
              ':',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            _buildTeamColumn(game.awayTeamShortName!, game.awayTeamResult!),
          ],
        ),
      )
    );
  }

  Widget _buildTeamColumn(String shortName, int score) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/logos/$shortName.png',
          height: 50,
          width: 50,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 8),
        Text(
          score.toString(),
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class MonthItem extends StatelessWidget {
  final int monthNumber;

  const MonthItem({super.key, required this.monthNumber});

  String _getMonthName(int month) {
    if (month < 1 || month > 12) return 'Invalid Month';
    return DateFormat.MMMM().format(DateTime(0, month));
  }

  @override
  Widget build(BuildContext context) {
    final monthName = _getMonthName(monthNumber);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          monthName,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        const Divider(thickness: 1),
      ],
    );
  }
}