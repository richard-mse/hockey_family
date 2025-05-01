part of 'home_view.dart';

class _HomeViewLoaded extends StatelessWidget {
  const _HomeViewLoaded();

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeNavigateToGameDetailState) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => GameDetailPage(game: state.game),
            ),
          );

          context.read<HomeBloc>().add(const HomeResetNavigationEvent());
        }
      },
      child: Builder(
        builder: (context) {
          final state = context.watch<HomeBloc>().state;
          if (state is HomeLoadedState) {
            return TableCalendarHockey(gamesList: state.games);
          } else if (state is HomeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeFailureState) {
            return Center(child: Text("Erreur : ${state.errorMessage}"));
          } else {
            return const SizedBox(); // fallback
          }
        },
      ),
    );
  }
}


class TableCalendarHockey extends StatefulWidget {
  final Set<Game> gamesList;
  const TableCalendarHockey({super.key, required this.gamesList});


  @override
  State<TableCalendarHockey> createState() => _TableCalendarHockeyState();
}


class _TableCalendarHockeyState extends State<TableCalendarHockey> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
      });
    }
  }

  Game? _getGameIfExists(DateTime day) {
    final dayUtc = DateTime.utc(day.year, day.month, day.day);
    try {
      return widget.gamesList.firstWhere((game) {
        final gameUtc = DateTime.utc(game.date.year, game.date.month, game.date.day);
        return ((gameUtc == dayUtc) && (game.homeTeamShortName == mainTeamName));
      });
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          Expanded(
            child: TableCalendar(
                shouldFillViewport: true,
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                // rowHeight: 50,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: _onDaySelected,
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
                locale: Localizations.localeOf(context).languageCode,
                calendarStyle: const CalendarStyle(
                  cellMargin: EdgeInsets.all(10),
                  cellPadding: EdgeInsets.all(10),
                ),
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, day, focusedDay) {
                    final game = _getGameIfExists(day);
                    return MyDayCellWidget(
                      day: day,
                      game: game,
                      hasGame: game != null,
                    );
                  },
                  selectedBuilder: (context, day, focusedDay) {
                    final game = _getGameIfExists(day);
                    return MyDayCellWidget(
                      day: day,
                      game: game,
                      isSelected: true,
                      isFocus: isSameDay(_selectedDay, focusedDay),
                      hasGame: game != null,
                    );
                  },
                  todayBuilder: (context, day, focusedDay) {
                    final game = _getGameIfExists(day);
                    return MyDayCellWidget(
                      day: day,
                      game: game,
                      isFocus: true,
                      hasGame: game != null,
                    );
                  },
                ),
              )
        ),
      ],
    );
  }
}


class MyDayCellWidget extends StatelessWidget {
  final DateTime day;
  final bool isSelected;
  final bool isFocus;
  final bool hasGame;
  final Game? game;

  const MyDayCellWidget({
    super.key,
    required this.day,
    this.isSelected = false,
    this.isFocus = false,
    this.hasGame = false,
    this.game,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (game != null) {
          context.read<HomeBloc>().add(HomeNavigateToGameDetailEvent(game!));
        }
      },
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.black : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  '${day.day}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: isFocus ? Colors.red : Colors.blue,
                  ),
                ),
              ),
            ),
            if (hasGame)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Image.network(
                    hockeyImgUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              )
            else
              const Spacer(),
          ],
        ),
      ),
    );
  }
}
