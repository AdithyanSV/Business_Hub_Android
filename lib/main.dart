import 'package:flutter/material.dart';
import 'screens/auth/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce App',
      theme: ThemeData(
        primaryColor: const Color(0xFF1C1B1F),
        scaffoldBackgroundColor: const Color(0xFFEFFFFF),
      ),
      home: const LoginPage(),
    );
  }
}