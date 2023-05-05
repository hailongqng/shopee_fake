import 'package:flutter/material.dart';
import 'package:shopee_fake/app/app_route.dart';
import 'package:shopee_fake/app/bloc/app_bloc.dart';
import 'package:shopee_fake/app/bloc/bloc_provider.dart';
import 'package:shopee_fake/app/models/app_config.dart';
import 'package:shopee_fake/app/pages/example/example_page.dart';
import 'package:shopee_fake/common/http_client.dart';

class MobileApp extends StatelessWidget {
  final AppConfig config;
  const MobileApp(this.config, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Setup Http Client
    HttpClient(config.baseUrl);

    return BlocProvider<AppBloc>(
      blocBuilder: () {
        final appBloc = AppBloc();
        appBloc.config = config;
        return appBloc;
      },
      child: MaterialApp(
        navigatorKey: AppRoute.navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: ExamplePage.routePath,
        routes: AppRoute.registerRoutes(),
      ),
    );
  }
}
