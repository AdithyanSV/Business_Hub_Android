import 'package:flutter/material.dart';

// Common App Bar Widget for both Login and Signup Pages
class FixedTitleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  
  const FixedTitleAppBar({
    super.key, 
    this.title = 'COMP Name',
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFEFFFFF),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black, 
          fontSize: 24, 
          fontWeight: FontWeight.bold
        ),
      ),
      centerTitle: true,
      automaticallyImplyLeading: showBackButton,
      leading: showBackButton 
        ? IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          )
        : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}