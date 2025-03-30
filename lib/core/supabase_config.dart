import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  // Private constructor to prevent instantiation
  SupabaseConfig._();

  // Static method to initialize Supabase
  static Future<void> initialize() async {
    await Supabase.initialize(
      // Replace with your actual Supabase project URL
      url: 'https://qnkymfcdzabpfvrxryvl.supabase.co',
      // Replace with your Supabase anon key
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFua3ltZmNkemFicGZ2cnhyeXZsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDMwMTQ5NzcsImV4cCI6MjA1ODU5MDk3N30.mR8M1EI_AJzrzfw6qJl5kORZvGEOEICrx7QHXWtN1bI',

      // Optional additional configurations
      debug: true, // Enable debug logging
      authOptions: FlutterAuthClientOptions(
        // Disable automatic URL handling
        authFlowType: AuthFlowType.pkce,
      ),
    );
  }

  // Getter to access Supabase client easily
  static SupabaseClient get supabase => Supabase.instance.client;
  static SupabaseClient get client => Supabase.instance.client;

  // Method to check if user is authenticated
  static bool get isAuthenticated => supabase.auth.currentUser != null;

  // Method to get current user
  static User? get currentUser => supabase.auth.currentUser;

  // Method to sign out
  static Future<void> signOut() async {
    await supabase.auth.signOut();
  }

// Send verification code for password reset
  static Future<void> sendPasswordResetCode(String email) async {
    await client.auth.signInWithOtp(
      email: email,
      shouldCreateUser: false,
      emailRedirectTo: null, // Disable redirect links
      data: {
        'send_as_code': true, // Request code instead of link
      },
    );
  }

  // Verify code and reset password
  static Future<void> verifyAndResetPassword({
    required String email,
    required String code,
    required String newPassword,
  }) async {
    // Verify the code first
    await client.auth.verifyOTP(
      email: email,
      token: code,
      type: OtpType.recovery,
    );

    // Then update the password
    await client.auth.updateUser(
      UserAttributes(password: newPassword),
    );
  }
}
