import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> initNotifications() async {
  const initSettings = InitializationSettings(
    android: AndroidInitializationSettings('@mipmap/ic_launcher'),
  );
  await flutterLocalNotificationsPlugin.initialize(initSettings);
}

Future<void> showGoalNotification(String score) async {
  const androidDetails = AndroidNotificationDetails(
    'goal_channel',
    'Goals',
    importance: Importance.max,
    priority: Priority.high,
  );

  const notifDetails = NotificationDetails(android: androidDetails);

  await flutterLocalNotificationsPlugin.show(
    0,
    'But marqué !',
    'Score : $score',
    notifDetails,
  );
}