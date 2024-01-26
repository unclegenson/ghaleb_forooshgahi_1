// NABEGHEHA.COM

import 'package:flutter/material.dart';

import 'package:plant_app_2/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant App',
      home: HomePage(),
    );
  }
}
