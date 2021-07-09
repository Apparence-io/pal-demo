import 'package:flutter/material.dart';
import 'package:pal/pal.dart';
import 'package:pal_demo_app/routes.dart';
import 'package:google_fonts/google_fonts.dart';

const bool PAL_LAUNCH_MODE = const bool.fromEnvironment("PAL_LAUNCH_MODE", defaultValue: true);

const String APP_TOKEN =
    "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI4ZWNkMjM5MC1kODExLTQxYzEtOWYxOS04ZWMyN2I0OTY0ZjAiLCJ0eXBlIjoiUFJPSkVDVCIsImlhdCI6MTYxNzM2NzAyMH0.c27i8hJ1QY9yzEx15yYKbn56qfIbPy58YvSia2M9VgE";

ValueNotifier<bool> palLaunchModeNotifier = ValueNotifier(false);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, child) {
        return Pal(
          editorModeEnabled: value,
          appToken: APP_TOKEN,
          childApp: MaterialApp(
            debugShowCheckedModeBanner: false,
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
                fontFamily: 'Poppins'),
            onGenerateRoute: routes,
          ),
        );
      },
      valueListenable: palLaunchModeNotifier,
    );
  }

  Widget buildO(BuildContext context) {
    return Pal(
      editorModeEnabled: PAL_LAUNCH_MODE,
      appToken: APP_TOKEN,
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
            fontFamily: 'Poppins'),
        onGenerateRoute: routes,
      ),
    );
  }

  Widget createPhoneApp({Widget child}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 450),
          child: child,
        ),
      ],
    );
  }
}
