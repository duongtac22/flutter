import 'package:flutter/material.dart';
import 'package:flutter_tutorial/common/settings.dart';
import 'package:flutter_tutorial/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      home: HomeScreen(
        key: homeScreenKey,
      ),
    );
  }
}
