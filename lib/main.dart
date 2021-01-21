import 'package:flutter/material.dart';
import 'package:pal/pal.dart';
import 'package:pal_demo_app/routes.dart';

import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Pal(
      editorModeEnabled: true,
      appToken: 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI5MThiZWYyOS1kODJkLTQ3Y2ItODQ2Yi1iZGY0Y2QyZmMyMzQiLCJ0eXBlIjoiUFJPSkVDVCIsImlhdCI6MTYwNjc0NzE2Nn0.8TgjVp9CvWNlTdKwzqsrbKk9mtPwbEoTTGhyZu7uZC4',
      childApp: MaterialApp(
        navigatorKey: navigatorKey,
        title: 'Pal Plugin Demo',
        navigatorObservers: [PalNavigatorObserver.instance()],
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
          fontFamily: 'Poppins'
        ),
        onGenerateRoute: routes,
      ),
    );
  }
}

