import 'package:flutter/material.dart';
import 'package:flutter_tutorial/common/settings.dart';
import 'package:flutter_tutorial/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'roboto',
          scaffoldBackgroundColor: const Color(0xFF0B0F2F),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
                fontFamily: GoogleFonts.roboto().fontFamily,
              )),
      title: 'Movies App',
      home: HomeScreen(
        key: homeScreenKey,
      ),
    );
  }
}
