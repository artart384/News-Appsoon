import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'splash/splash.dart';
import 'splash/splash_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: SplashBinding(),
        home: const Splash());
  }
}
