import 'package:couldai_user_app/screens/trade_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Binary Option Trade',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.amber,
        scaffoldBackgroundColor: const Color(0xFF121212),
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          brightness: Brightness.dark,
        ),
      ),
      home: const TradeScreen(),
    );
  }
}
