import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screens/on_boarding_screen.dart';
import 'package:flutter_tutorial/screens/register_screen.dart';
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
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: const Color(0xFFFEFEFE),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
                fontFamily: GoogleFonts.poppins().fontFamily,
              )),
      title: 'Shopfee App',
      // home: OnBoardingScreen(),
      routes: {
        "/": (context) => const OnBoardingScreen(),
        "/register": (context) => const RegisterScreen()
      },
    );
  }
}
