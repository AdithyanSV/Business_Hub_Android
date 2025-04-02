import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../auth/login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserProfile.sampleUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _showLogoutDialog(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[200],
              child: const Icon(Icons.person, size: 50),
            ),
            const SizedBox(height: 16),
            Text(user.name, style: Theme.of(context).textTheme.titleLarge),
            Text(user.email, style: TextStyle(color: Colors.grey[600])),
            const SizedBox(height: 32),
            _buildProfileSection(context, 'ACCOUNT SETTINGS', [
              _buildProfileTile(Icons.person, 'Personal Information'),
              _buildProfileTile(Icons.location_on, 'Addresses'),
              _buildProfileTile(Icons.credit_card, 'Payment Methods'),
            ]),
            const SizedBox(height: 24),
            _buildProfileSection(context, 'ORDERS & ACTIVITY', [
              _buildProfileTile(Icons.shopping_bag, 'Order History'),
              _buildProfileTile(Icons.favorite, 'Wishlist'),
              _buildProfileTile(Icons.star, 'Reviews'),
            ]),
            const SizedBox(height: 24),
            _buildProfileSection(context, 'APP SETTINGS', [
              _buildProfileTile(Icons.notifications, 'Notifications'),
              _buildProfileTile(Icons.privacy_tip, 'Privacy'),
              _buildProfileTile(Icons.help, 'Help & Support'),
            ]),
            const SizedBox(height: 32),
            Text('v1.0.0', style: TextStyle(color: Colors.grey[400])),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection(
      BuildContext context, String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }

  Widget _buildProfileTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      contentPadding: EdgeInsets.zero,
      onTap: () {},
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Log Out?'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CANCEL'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
              );
            },
            child: const Text('LOG OUT'),
          ),
        ],
      ),
    );
  }
}
