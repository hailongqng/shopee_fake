import 'package:flutter/material.dart';
import 'package:shopee_fake/app/app.dart';
import 'package:shopee_fake/app/models/app_config.dart';

void main() {
  final appConfig = AppConfig(
    baseUrl: "https://dog.ceo/api",
    facebookKey: "xxxix",
  );
  runApp(MobileApp(appConfig));
}
