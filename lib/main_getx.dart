import 'package:flutter/material.dart';
import 'package:pal/pal.dart';
import 'package:pal_demo_app/routes.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetXMyApp());
}

const String APP_TOKEN =
    "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI4ZWNkMjM5MC1kODExLTQxYzEtOWYxOS04ZWMyN2I0OTY0ZjAiLCJ0eXBlIjoiUFJPSkVDVCIsImlhdCI6MTYxNzM2NzAyMH0.c27i8hJ1QY9yzEx15yYKbn56qfIbPy58YvSia2M9VgE";

class GetXMyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Pal.fromAppBuilder(
      navigatorKey: navigatorKey,
      editorModeEnabled: false,
      appToken: APP_TOKEN,
      childAppBuilder: (context) => GetMaterialApp(
        navigatorKey: navigatorKey,
        title: 'Pal Plugin Demo',
        navigatorObservers: [PalNavigatorObserver.instance()],
        onGenerateRoute: routes,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            hintColor: Color(0xFFA3ABB3),
            primaryColor: Color(0xFF111820),
            accentColor: Color(0xFF268FCD),
            backgroundColor: Color(0xFF111820),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: TextTheme(
              bodyText1: GoogleFonts.poppins(fontSize: 32, color: Color(0xFFDFDFD5), height: 1.6),
              bodyText2: TextStyle(),
            ),
            fontFamily: 'Poppins'),
      ),
    );
  }
}
