import 'package:flutter/material.dart';
import 'package:muslim/features/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DinԐ ',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Splashscreen(),
    );
  }
}



