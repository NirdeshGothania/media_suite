import 'dart:async';

import 'package:flutter/material.dart';
import 'package:media_suite/HomePage.dart';

class SplashPage1 extends StatefulWidget {
  const SplashPage1({super.key});

  @override
  State<SplashPage1> createState() => SplashPage();
}

class SplashPage extends State<SplashPage1> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xff2b2d7f),
        child: const Center(
          child: Text(
            'Everyday Series',
            style: TextStyle(
                fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
