import 'package:flutter/material.dart';
import '../../widgets/category_card.dart';
import '../../widgets/product_card.dart';
import '../../models/product.dart';
import 'category_page.dart';
import '../auth/login_page.dart';
import 'product_page.dart'; // Import the ProductDetailPage

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
              // Search bar and icons row
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey[600]),
                          const SizedBox(width: 8),
                          Text(
                            'Search for products',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      height: 50,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(Icons.shopping_cart_outlined),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      // Logout (go back to login screen)
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(Icons.person_outline),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 30),
              
              // Category grid
              Row(
                children: [
                  Expanded(
                    child: CategoryCard(
                      title: 'Electronics',
                      icon: Icons.devices,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CategoryPage(categoryName: 'Electronics'),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CategoryCard(
                      title: 'Food & Drink',
                      icon: Icons.fastfood,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CategoryPage(categoryName: 'Food & Drink'),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 10),
              
              Row(
                children: [
                  Expanded(
                    child: CategoryCard(
                      title: 'Beauty',
                      icon: Icons.face,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CategoryPage(categoryName: 'Beauty'),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CategoryCard(
                      title: 'Home & Garden',
                      icon: Icons.home,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CategoryPage(categoryName: 'Home & Garden'),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 30),
              
              // Products section
              const Text(
                'Products',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Products list
              Expanded(
                child: ListView.builder(
                  itemCount: Product.sampleProducts.length,
                  itemBuilder: (context, index) {
                    final product = Product.sampleProducts[index];
                    return ProductCard(
                      title: product.title,
                      price: product.price,
                      productId: product.id,
                      onTap: () {
                        // Navigate to ProductDetailPage with the product ID
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailPage(productId: product.id),
                          ),
                        );
                      },
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
}