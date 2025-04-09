part of 'home_view.dart';

class _HomeViewLoaded extends StatelessWidget {
  const _HomeViewLoaded({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    final state = bloc.state as HomeLoadedState;
    return TableCalendarHockey();
  }
}


class TableCalendarHockey extends StatefulWidget {
  const TableCalendarHockey({super.key});

  @override
  State<TableCalendarHockey> createState() => _TableCalendarHockeyState();
}


class _TableCalendarHockeyState extends State<TableCalendarHockey> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  late final ValueNotifier<Event?> _selectedEvent; // ⬅️ nullable

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvent = ValueNotifier(_getEventForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvent.dispose();
    super.dispose();
  }

  Event? _getEventForDay(DateTime day) {
    return kEvents[DateTime.utc(day.year, day.month, day.day)];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
      });

      _selectedEvent.value = _getEventForDay(selectedDay);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          rowHeight: 100,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          onDaySelected: _onDaySelected,
          eventLoader: (day) => _getEventForDay(day) != null ? [true] : [],
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
              final hasEvent = _getEventForDay(day) != null;
              return MyDayCellWidget(day: day, showImage: hasEvent);
            },
            selectedBuilder: (context, day, focusedDay) {
              final hasEvent = _getEventForDay(day) != null;
              return MyDayCellWidget(
                day: day,
                isSelected: true,
                isFocus: isSameDay(_selectedDay, focusedDay),
                showImage: hasEvent,
              );
            },
            todayBuilder: (context, day, focusedDay) {
              final hasEvent = _getEventForDay(day) != null;
              return MyDayCellWidget(
                day: day,
                isFocus: true,
                showImage: hasEvent,
              );
            },
          ),
        ),
        const SizedBox(height: 8.0),

        // 🧩 Placeholder ou contenu statique
        Expanded(
          child: ValueListenableBuilder<Event?>(
            valueListenable: _selectedEvent,
            builder: (context, event, _) {
              return Center(
                child: Placeholder(
                  fallbackHeight: 100,
                  color: Colors.blueGrey,
                  strokeWidth: 2,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}


class MyDayCellWidget extends StatelessWidget {
  final DateTime day;
  final bool isSelected;
  final bool isFocus;
  final bool showImage;

  const MyDayCellWidget({
    super.key,
    required this.day,
    this.isSelected = false,
    this.isFocus = false,
    this.showImage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Colors.white : Colors.transparent,
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
                  color: isFocus ? Colors.red : Colors.white,
                ),
              ),
            ),
          ),
          if (showImage)
            Expanded(
              child: ClipRRect(
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
    );
  }
}
