import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopee_fake/common/constants/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const routePath = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.screenBackground,
      body: Column(
        children: [
          Container(
            height: 100.h,
            color: AppColors.primaryColorApp,
          ),
          const Expanded(child: SizedBox())
        ],
      ),
    );
  }
}
