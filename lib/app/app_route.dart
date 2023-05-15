import 'package:flutter/widgets.dart';
import 'package:shopee_fake/app/pages/example/example_page.dart';
import 'package:shopee_fake/app/pages/home/home_screen.dart';
import 'package:shopee_fake/app/pages/splash/splash_screen.dart';

class AppRoute {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Map<String, WidgetBuilder> registerRoutes() {
    return {
      SplashScreen.routePath: (context) => const SplashScreen(),
      HomeScreen.routePath: (context) => const HomeScreen(),
    };
  }
}
