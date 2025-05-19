// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'hockey_family';

  @override
  String get btn_reservation_empty => 'Reserve your ticket';

  @override
  String get btn_reservation_full => 'Reservation\'s list is full';

  @override
  String get btn_reservation_remove => 'Withdraw match\'s reservation';

  @override
  String get title_game_result_page => 'Game\'s result';

  @override
  String get title_game_page => 'All matches';

  @override
  String get title_current_game_page => 'Games of the day';

  @override
  String get title_home_page => 'Home page';
}
