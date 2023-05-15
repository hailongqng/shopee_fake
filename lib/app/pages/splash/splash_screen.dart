import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopee_fake/app/pages/home/home_screen.dart';
import 'package:shopee_fake/common/constants/app_assets.dart';
import 'package:shopee_fake/common/constants/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  static const routePath = '/splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> handleRedirect(BuildContext context) async {
    //Wait 2 sec for Local storage build up
    Future.delayed(const Duration(seconds: 2)).then((_) async {
      var navigateRoute = HomeScreen.routePath;
      Navigator.of(context).pushReplacementNamed(navigateRoute);
    });
  }

  @override
  void initState() {
    super.initState();
    handleRedirect(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.screenBackground,
      child: Center(
        child: SizedBox(
          child: SvgPicture.asset(
            AppAssets.icShopee,
            width: 200.w,
          ),
        ),
      ),
    );
  }
}
