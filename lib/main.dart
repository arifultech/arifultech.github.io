import 'package:flutter/material.dart';
import 'Pages/home_page.dart';


void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ariful Portfolio",
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xff0f172a),
        primaryColor: const Color(0xff38bdf8),
      ),
      home: HomePage(),
    );
  }
}