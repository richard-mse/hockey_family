// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Hockey Famille fr';

  @override
  String get btn_reservation_empty => 'Réserve ton billet';

  @override
  String get btn_reservation_full => 'La liste de réservation est remplie';

  @override
  String get btn_reservation_remove => 'Se désinscrire de la liste';

  @override
  String get title_game_result_page => 'Résultat du match';

  @override
  String get title_game_page => 'Match de la saison';

  @override
  String get title_current_game_page => 'Match du jour';

  @override
  String get title_home_page => 'Page d\'acceuil';
}

/// The translations for French, as used in Switzerland (`fr_CH`).
class AppLocalizationsFrCh extends AppLocalizationsFr {
  AppLocalizationsFrCh(): super('fr_CH');

  @override
  String get appTitle => 'hockey_family_ch';

  @override
  String get btn_reservation_empty => 'Réserve ton billet';

  @override
  String get btn_reservation_full => 'La liste de réservation est remplie';

  @override
  String get btn_reservation_remove => 'Se désinscrire de la liste';

  @override
  String get title_game_result_page => 'Résultat du match';

  @override
  String get title_game_page => 'Match de la saison';

  @override
  String get title_current_game_page => 'Match du jour';

  @override
  String get title_home_page => 'Page d\'acceuil';
}
