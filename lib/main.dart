import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hockey_family/src/services/firebase.dart';
import 'firebase_options.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initializeDateFormatting().then((_) => runApp(MyApp()));
}
