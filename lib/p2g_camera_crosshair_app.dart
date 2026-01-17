import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'generated/l10n.dart';

class P2gCameraCrosshairApp extends StatelessWidget {
  const P2gCameraCrosshairApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'P2G Camera Crosshair',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.cameraPage,
      onGenerateRoute: AppRouter.generateRoute,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('en'),
    );
  }
}
