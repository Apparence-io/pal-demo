import 'package:flutter/material.dart';

import 'ui/pages/home/home_page.dart';
import 'ui/pages/main_menu.dart';
import 'ui/pages/movie/movie_page.dart';
import 'ui/pages/profile/profile.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future appPushNamed(String route, {Object arguments}) => navigatorKey.currentState.pushNamed(route, arguments: arguments);

Route<dynamic> routes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => PageWithMenu(
          routes: [
            MenuRoute(label: "Home", icon: Icons.home, path: '/home',
              pageBuilder: (context) => HomePage(),
              settings: RouteSettings(name: '/home')),
            MenuRoute(label: "Library", icon: Icons.video_library_rounded, path: '/library',
              pageBuilder: (context) => ProfilePage(),
              settings: RouteSettings(name: '/profile')),
            MenuRoute(label: "Profile", icon: Icons.person, path: '/profile',
              pageBuilder: (context) => ProfilePage(),
              settings: RouteSettings(name: '/profile')),
          ],
        ),
        maintainState: true,
      );
    case '/movie':
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => MoviePage(),
        maintainState: true,
      );
    default:
      throw 'unexpected Route';
  }
}