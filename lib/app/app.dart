import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopee_fake/app/app_route.dart';
import 'package:shopee_fake/app/bloc/app_bloc.dart';
import 'package:shopee_fake/app/bloc/bloc_provider.dart';
import 'package:shopee_fake/app/models/app_config.dart';
import 'package:shopee_fake/app/pages/splash/splash_screen.dart';
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
      child: MediaQuery(
        data: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (_, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              navigatorKey: AppRoute.navigatorKey,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const SplashScreen(),
              routes: AppRoute.registerRoutes(),
            );
          },
        ),
      ),
    );
  }
}
