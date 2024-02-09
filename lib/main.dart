import 'package:shoshin_assignment/colors.dart';
import 'package:flutter/material.dart';
import 'package:shoshin_assignment/screens/homeScreen.dart';
import 'package:shoshin_assignment/screens/offer_screen.dart';
import 'package:shoshin_assignment/screens/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: ThemeData.light(),
      home: const HomeScreen(),
    );
  }
}