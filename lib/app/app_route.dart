import 'package:flutter/widgets.dart';
import 'package:shopee_fake/app/pages/example/example_page.dart';

class AppRoute {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Map<String, WidgetBuilder> registerRoutes() {
    return {
      ExamplePage.routePath: (context) => ExamplePage.registerRoute(context),
    };
  }
}
