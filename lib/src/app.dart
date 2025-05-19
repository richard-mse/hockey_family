import 'package:flutter/material.dart';
import 'package:hockey_family/l10n/gen/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hockey_family/src/navigation/app_router.dart';
import 'package:hockey_family/src/ui/theme/custom_theme.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.getInstance().router,
      restorationScopeId: 'hockey_family',

      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      theme: CustomTheme.light(),
      darkTheme: CustomTheme.dark(),
  
    );
  }
}
