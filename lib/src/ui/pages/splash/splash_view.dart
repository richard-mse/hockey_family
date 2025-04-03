import 'package:flutter/material.dart';
import 'package:hockey_family/l10n/gen/app_localizations.dart';
import 'package:hockey_family/src/services/app_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => onStartUp());
    super.initState();
  }

  void onStartUp() async {
    await AppService.getInstance().onAppStart(context);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text(AppLocalizations.of(context)!.appTitle),
      ),
    );
  }
}
