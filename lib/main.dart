import 'package:flutter/material.dart';
import 'package:pal_demo_app/routes.dart';
import 'package:pal_demo_app/ui/pages/main_menu.dart';

import 'ui/pages/home/home_page.dart';
import 'ui/pages/movie/movie_page.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ui/pages/profile/profile.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Pal Plugin Demo',
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
    );
  }
}

