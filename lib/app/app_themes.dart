import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopee_fake/common/constants/app_colors.dart';

class AppTheme {
  ThemeData getTheme() {
    return ThemeData(
      fontFamily: 'Shopee',
      primaryColor: AppColors.primaryColor,
      backgroundColor: AppColors.screenBackground,
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: AppColors.mainTitleTextColor,
          fontSize: 20.0.sp,
          fontWeight: FontWeight.w500,
        ),
        displayMedium: TextStyle(
          color: AppColors.mainTitleTextColor,
          fontSize: 18.0.sp,
          fontWeight: FontWeight.w500,
        ),
        //Small title text
        displaySmall: TextStyle(
          color: AppColors.mainTitleTextColor,
          fontSize: 14.0.sp,
          fontWeight: FontWeight.w500,
        ),
        headlineMedium: TextStyle(
          color: AppColors.mainTitleTextColor,
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
        ),
        headlineSmall: TextStyle(
          color: Colors.white,
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
        ),
        titleLarge: TextStyle(
          color: AppColors.mainTextColor,
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
        ),
        bodyLarge: TextStyle(
          fontSize: 16.0.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.mainTextColor,
        ),
        bodyMedium: TextStyle(
          fontSize: 10.0.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.mainTextColor,
        ),
        titleMedium: const TextStyle(
          color: AppColors.mainTextColor,
        ),
        titleSmall: TextStyle(
          fontSize: 9.0.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.mainTextColor,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.tbSelected,
        unselectedItemColor: AppColors.tbNormal,
        selectedLabelStyle: TextStyle(
          fontSize: 12.0.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.tbSelected,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12.0.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.tbNormal,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          onSurface: AppColors.accentColor,
          primary: AppColors.primaryColor,
          onPrimary: Colors.white,
          foregroundColor: Colors.white,
          //onPrimary
          backgroundColor: AppColors.primaryColor,
          //primary
          disabledForegroundColor: AppColors.accentColor.withOpacity(0.38),
          //onSurface
          disabledBackgroundColor: AppColors.accentColor.withOpacity(0.12),
          //onSurface
          // padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(55)),
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            wordSpacing: 2,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
        primary: AppColors.primaryColor,
        foregroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(55)),
        textStyle: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 16.sp,
          wordSpacing: 2,
        ),
      )),
      buttonTheme: ButtonThemeData(
        padding: EdgeInsets.fromLTRB(15, 0, 16.w, 0),
        buttonColor: AppColors.primaryColor,
        shape: const RoundedRectangleBorder(),
        // textTheme: Theme.of(context).primaryColor,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: AppColors.accentColor,
        background: AppColors.screenBackground,
      ),
    );
  }
}
