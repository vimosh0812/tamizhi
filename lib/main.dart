import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'l10n/app_localizations.dart';
import 'routes.dart';
import 'theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) => MaterialApp.router(
        title: 'App',
        theme: AppTheme.lightTheme(),
        localizationsDelegates: [
          ...AppLocalizations.localizationsDelegates,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        builder: (context, child) {
          return child!;
        },
        themeMode: ThemeMode.light,
        routerConfig: router,
      ),
    );
  }
}
