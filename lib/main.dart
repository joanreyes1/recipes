import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:recipes/src/pages/alert_page.dart';
import 'package:recipes/src/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('es', ''), // Spanish, no country code
      ],
      initialRoute: '/',
      routes: getAplicationRoutes(),
      onGenerateRoute: (settings) {
        // ignore: avoid_print
        print('ruta llamando: ${settings.name}');

        return MaterialPageRoute(
          builder: (BuildContext context) => const AlertPage(),
        );
      },
    );
  }
}
