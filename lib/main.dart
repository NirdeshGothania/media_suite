import 'package:flutter/material.dart';
import 'package:media_suite/SplashPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Media Suite',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff2b2d7f)),
        brightness: Brightness.light,
      ),
      home: const SplashPage1(),
    );
  }
}
