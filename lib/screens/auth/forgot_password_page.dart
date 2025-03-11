import 'package:flutter/material.dart';
import '../../widgets/auth_widgets.dart';
import 'login_page.dart';
import 'reset_password_page.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FixedTitleAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Forgot Password Illustration
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/forgot_password.png', height: 150),
            ),
            const SizedBox(height: 20),
            // Description Text
            const Text(
              'Enter your email address and we\'ll send you a link to reset your password.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF1C1B1F),
              ),
            ),
            const SizedBox(height: 20),
            // Email Input Field
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your email',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 20),
            // Send Reset Link Button
            ElevatedButton(
              onPressed: () {
                // Navigate to PasswordResetPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ResetPasswordPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                backgroundColor: const Color(0xFF1C1B1F),
                foregroundColor: const Color(0xFFEFF1F5),
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: const Text('Send Reset Link'),
            ),
            const SizedBox(height: 10),
            // Back to Login Button
            ElevatedButton(
              onPressed: () {
                // Navigate back to login page
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                backgroundColor: const Color(0xFFEFF1F5),
                foregroundColor: const Color(0xFF1C1B1F),
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              child: const Text('Back to Login'),
            ),
          ],
        ),
      ),
    );
  }
}