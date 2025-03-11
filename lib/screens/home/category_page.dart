import 'package:flutter/material.dart';
import '../../widgets/product_card.dart';
import '../../models/product.dart';

class CategoryPage extends StatelessWidget {
  final String categoryName;
  
  const CategoryPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final categoryProducts = Product.getByCategory(categoryName);
    
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
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(Icons.person_outline),
                  ),
                ],
              ),
              
              const SizedBox(height: 20),
              
              // Category header with back button
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios, size: 20),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        '$categoryName Category',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 20),
              
              // Products list
              Expanded(
                child: ListView.builder(
                  itemCount: categoryProducts.length,
                  itemBuilder: (context, index) {
                    final product = categoryProducts[index];
                    return ProductCard(
                      title: product.title,
                      price: product.price,
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