import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hockey_family/src/services/goal_watcher_service.dart';
import 'package:hockey_family/src/utils/notification_helper.dart';
import 'firebase_options.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialisation de Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialisation des notifications locales
  await initNotifications();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();

  GoalWatcherService().startPolling();

  await initializeDateFormatting();

  runApp(const MyApp());
}
