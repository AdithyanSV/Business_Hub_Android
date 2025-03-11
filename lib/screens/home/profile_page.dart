import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../auth/login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = UserProfile.sampleUser;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Show logout confirmation dialog
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Log Out'),
                  content: const Text('Are you sure you want to log out?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Close dialog
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      },
                      child: const Text('Log Out'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile header
              Center(
                child: Column(
                  children: [
                    // Profile picture
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Name
                    Text(
                      user.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    
                    // Email
                    Text(
                      user.email,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                  ],
                ),
              ),
              
              // Account settings section
              const Text(
                'Account Settings',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              
              // Personal info card
              _buildSettingsCard(
                icon: Icons.person_outline,
                title: 'Personal Information',
                subtitle: 'Edit your personal details',
                onTap: () {
                  // Navigate to edit personal info page
                },
              ),
              
              // Addresses card
              _buildSettingsCard(
                icon: Icons.location_on_outlined,
                title: 'Addresses',
                subtitle: '${user.addresses.length} saved addresses',
                onTap: () {
                  // Navigate to addresses page
                },
              ),
              
              // Payment methods card
              _buildSettingsCard(
                icon: Icons.credit_card_outlined,
                title: 'Payment Methods',
                subtitle: 'Manage your payment options',
                onTap: () {
                  // Navigate to payment methods page
                },
              ),
              
              const SizedBox(height: 24),
              
              // Orders and Activity section
              const Text(
                'Orders & Activity',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              
              // Order history card
              _buildSettingsCard(
                icon: Icons.shopping_bag_outlined,
                title: 'Order History',
                subtitle: 'View past orders and track packages',
                onTap: () {
                  // Navigate to order history page
                },
              ),
              
              // Wishlist card
              _buildSettingsCard(
                icon: Icons.favorite_border,
                title: 'Wishlist',
                subtitle: 'View your saved items',
                onTap: () {
                  // Navigate to wishlist page
                },
              ),
              
              // Reviews card
              _buildSettingsCard(
                icon: Icons.star_border,
                title: 'Reviews',
                subtitle: 'Manage your product reviews',
                onTap: () {
                  // Navigate to reviews page
                },
              ),
              
              const SizedBox(height: 24),
              
              // App settings section
              const Text(
                'App Settings',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              
              // Notifications card
              _buildSettingsCard(
                icon: Icons.notifications_outlined,
                title: 'Notifications',
                subtitle: 'Manage your notification preferences',
                onTap: () {
                  // Navigate to notifications settings page
                },
              ),
              
              // Privacy card
              _buildSettingsCard(
                icon: Icons.privacy_tip_outlined,
                title: 'Privacy Settings',
                subtitle: 'Control your data and privacy options',
                onTap: () {
                  // Navigate to privacy settings page
                },
              ),
              
              // Help card
              _buildSettingsCard(
                icon: Icons.help_outline,
                title: 'Help & Support',
                subtitle: 'Contact customer service',
                onTap: () {
                  // Navigate to help & support page
                },
              ),
              
              const SizedBox(height: 24),
              
              // Version info
              Center(
                child: Text(
                  'Version 1.0.0',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildSettingsCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey[300]!),
      ),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        onTap: onTap,
      ),
    );
  }
}