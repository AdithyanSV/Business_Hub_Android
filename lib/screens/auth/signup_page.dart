import 'package:flutter/material.dart';
import '../../widgets/auth_widgets.dart';
import 'login_page.dart';
import '../home/home_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FixedTitleAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Sign Up Illustration
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset('assets/signup.png', height: 150),
              ),
              const SizedBox(height: 20),
              // Full Name Input Field
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your full name',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 10),
              // Email Input Field
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 10),
              // Password Input Field
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Create a password',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  suffixIcon: const Icon(Icons.visibility),
                ),
              ),
              const SizedBox(height: 10),
              // Confirm Password Input Field
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Confirm your password',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  suffixIcon: const Icon(Icons.visibility),
                ),
              ),
              const SizedBox(height: 20),
              // Sign Up Button
              ElevatedButton(
                onPressed: () {
                  // Navigate to HomePage after successful signup
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  backgroundColor: const Color(0xFF1C1B1F),
                  foregroundColor: const Color(0xFFEFF1F5),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                child: const Text('Sign Up'),
              ),
              const SizedBox(height: 10),
              // Already have account button
              ElevatedButton(
                onPressed: () {
                  // Navigate back to login page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  backgroundColor: const Color(0xFFEFF1F5),
                  foregroundColor: const Color(0xFF1C1B1F),
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
                child: const Text('Already have an account? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}