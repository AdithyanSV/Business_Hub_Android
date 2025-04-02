import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/auth/login_page.dart';
import 'widgets/homepage_widget.dart';
import 'screens/cart/cart_page.dart';

void main() async {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await Supabase.initialize(
    url:
        'https://qnkymfcdzabpfvrxryvl.supabase.co', // Replace with your Supabase project URL
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFua3ltZmNkemFicGZ2cnhyeXZsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDMwMTQ5NzcsImV4cCI6MjA1ODU5MDk3N30.mR8M1EI_AJzrzfw6qJl5kORZvGEOEICrx7QHXWtN1bI', // Replace with your Supabase anon key
    debug: true, // Optional: enables Supabase debug logging
  );

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
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1C1B1F),
            foregroundColor: Colors.white,
          ),
        ),
      ),
      initialRoute: '/login', // Set the initial route
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(), // Make sure HomePage exists
        '/cart': (context) => const CartPage(),
      },
    );
  }
}
