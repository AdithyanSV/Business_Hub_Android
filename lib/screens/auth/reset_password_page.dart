import 'package:flutter/material.dart';
import '../../widgets/auth_widgets.dart';
import 'login_page.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

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
            // Password Reset Illustration
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/reset_password.png', height: 150),
            ),
            const SizedBox(height: 20),
            // Description Text
            const Text(
              'Enter your verification code and create a new password.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF1C1B1F),
              ),
            ),
            const SizedBox(height: 20),
            // Verification Code Input Field
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter verification code',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 10),
            // New Password Input Field
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter new password',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                suffixIcon: const Icon(Icons.visibility),
              ),
            ),
            const SizedBox(height: 10),
            // Confirm New Password Input Field
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Confirm new password',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                suffixIcon: const Icon(Icons.visibility),
              ),
            ),
            const SizedBox(height: 20),
            // Reset Password Button
            ElevatedButton(
              onPressed: () {
                // Navigate to LoginPage after successful password reset
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false,
                );
                
                // Show success message
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Password reset successful. Please login with your new credentials.'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                backgroundColor: const Color(0xFF1C1B1F),
                foregroundColor: const Color(0xFFEFF1F5),
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: const Text('Reset Password'),
            ),
            const SizedBox(height: 10),
            // Resend Code Button
            ElevatedButton(
              onPressed: () {
                // Show message for resending code
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Verification code has been resent to your email.'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                backgroundColor: const Color(0xFFEFF1F5),
                foregroundColor: const Color(0xFF1C1B1F),
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              child: const Text('Resend Code'),
            ),
          ],
        ),
      ),
    );
  }
}