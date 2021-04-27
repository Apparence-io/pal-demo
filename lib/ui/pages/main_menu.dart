import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class MenuRoutePath {}

class MenuRoute {
  String label;
  IconData icon;
  String path;
  WidgetBuilder pageBuilder;
  RouteSettings settings;

  MenuRoute({@required this.label, @required this.icon, @required this.path, @required this.pageBuilder, @required this.settings});
}

class PageWithMenu extends StatelessWidget {
  final List<MenuRoute> routes;

  final ValueNotifier<int> state;

  final MenuRouterDelegate menuRouterDelegate;

  PageWithMenu({@required this.routes})
      : this.menuRouterDelegate = MenuRouterDelegate(routes),
        this.state = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Router(
            routerDelegate: menuRouterDelegate,
          ),
          bottomNavigationBar: _buildBottomBar(context),
        ));
  }

  _buildBottomBar(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: state,
      builder: (ctx, value, child) {
        return BottomNavigationBar(
          items: routes
              .map((route) => BottomNavigationBarItem(
                    icon: Icon(
                      route.icon,
                      key: ValueKey("${route.icon}"),
                    ),
                    label: route.label,
                  ))
              .toList(),
          currentIndex: value,
          backgroundColor: Color(0xFF121A23),
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: new IconThemeData(
            color: Theme.of(context).accentColor,
          ),
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.blueGrey[300],
          onTap: (index) {
            state.value = index;
            menuRouterDelegate.goPage(index);
          },
          // onTap: _onItemTapped,
        );
      },
    );
  }
}

class MenuRouterDelegate extends RouterDelegate<MenuRoutePath> with ChangeNotifier, PopNavigatorRouterDelegateMixin<MenuRoutePath> {
  final List<MenuRoute> routes;

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  MenuRouterDelegate(this.routes);

  void goPage(int n) {
    navigatorKey.currentState.pushNamed(routes[n].path);
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        initialRoute: routes.first.path,
        onGenerateRoute: (RouteSettings settings) {
          var searchedRoute = routes.firstWhere((element) => element.path == settings.name, orElse: () => routes.first);
          return MaterialPageRoute(builder: searchedRoute.pageBuilder, settings: searchedRoute.settings);
        });
  }

  @override
  Future<void> setNewRoutePath(MenuRoutePath configuration) async {
    print("setNewRoutePath ${configuration.toString()}");
  }
}

class FadeAnimationPage extends Page {
  final Widget child;

  FadeAnimationPage({Key key, this.child, String name}) : super(key: key, name: name);

  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 2000),
      settings: this,
      pageBuilder: (context, animation, animation2) {
        var curveTween = CurveTween(curve: Curves.easeIn);
        return FadeTransition(
          opacity: animation.drive(curveTween),
          child: child,
        );
      },
    );
  }
}

class PageFake extends StatelessWidget {
  final Color bgColor;

  PageFake(this.bgColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
    );
  }
}
