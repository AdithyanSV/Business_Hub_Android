import 'package:flutter/material.dart';
import '../../widgets/category_card.dart';
import '../../widgets/product_card.dart';
import '../../models/product.dart';
import 'category_page.dart';
import '../auth/login_page.dart';
import 'product_page.dart';
import '../cart/cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar and icons
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: const Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 8),
                          Text('Search for products',
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),

                  // Cart Button - Ensure it navigates to the cart page
                  _buildIconButton(
                    Icons.shopping_cart_outlined,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const CartPage()),
                      );
                    },
                  ),

                  const SizedBox(width: 8),

                  // Profile Button - Navigates to Login Page
                  _buildIconButton(
                    Icons.person_outlined,
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginPage()),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Category grid
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: _buildCategoryCard('Electronics',
                              Icons.devices, 'Electronics', context)),
                      const SizedBox(width: 3),
                      Expanded(
                          child: _buildCategoryCard('Food & Drink',
                              Icons.fastfood, 'Food & Drink', context)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                          child: _buildCategoryCard(
                              'Beauty', Icons.face, 'Beauty', context)),
                      const SizedBox(width: 3),
                      Expanded(
                          child: _buildCategoryCard('Home & Garden', Icons.home,
                              'Home & Garden', context)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Products section
              const Text('Products',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),

              // Expanded ListView for Products (ensures scrolling)
              Expanded(
                child: ListView.builder(
                  itemCount: Product.sampleProducts.length,
                  itemBuilder: (_, index) {
                    final product = Product.sampleProducts[index];
                    return ProductCard(
                      title: product.title,
                      price: product.price,
                      productId: product.id,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ProductDetailPage(productId: product.id),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(icon),
      ),
    );
  }

  Widget _buildCategoryCard(
      String title, IconData icon, String categoryName, BuildContext context) {
    return CategoryCard(
      title: title,
      icon: icon,
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CategoryPage(categoryName: categoryName),
        ),
      ),
    );
  }
}
