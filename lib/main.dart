import 'package:flutter/material.dart';

import 'ui/pages/home/home_page.dart';

void main() {
  runApp(MyApp());
}

Route<dynamic> route(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => HomePage(),
        maintainState: true,
      );
    default:
      throw 'unexpected Route';
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pal Plugin Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        hintColor: Color(0xFFA3ABB3),
        primaryColor: Color(0xFF111820),
        accentColor: Color(0xFF268FCD),
        backgroundColor: Color(0xFF111820),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: route,
    );
  }
}

