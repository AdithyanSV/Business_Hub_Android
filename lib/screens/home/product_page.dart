import 'package:flutter/material.dart';
import '../../models/product.dart';

class ProductDetailPage extends StatefulWidget {
  final String productId;

  const ProductDetailPage({super.key, required this.productId});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late Product product;
  String? selectedColor;
  String? selectedVariant;
  int quantity = 1;
  
  @override
  void initState() {
    super.initState();
    product = Product.getById(widget.productId);
    if (product.colors != null && product.colors!.isNotEmpty) {
      selectedColor = product.colors![0];
    }
    if (product.variants != null && product.variants!.isNotEmpty) {
      final variantType = product.variants!.keys.first;
      selectedVariant = product.variants![variantType]![0];
    }
  }

  void addToCart() {
    // Add to cart logic here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Added to cart')),
    );
  }

  void checkout() {
    // Navigate to checkout
    Navigator.pushNamed(context, '/checkout');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Images
            SizedBox(
              height: 240,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.grey[200],
                      height: double.infinity,
                      child: Center(
                        child: product.imageUrl != null
                            ? Image.network(product.imageUrl!)
                            : const Icon(Icons.image, size: 80, color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.grey[200],
                            child: const Center(
                              child: Text('Image 3', style: TextStyle(color: Colors.grey)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: Container(
                            color: Colors.grey[200],
                            child: const Center(
                              child: Text('Image 4', style: TextStyle(color: Colors.grey)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // Image selection indicators
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Image 1', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Text('Image 2', style: TextStyle(color: Colors.grey[500])),
                ],
              ),
            ),
            
            // Product info
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product title
                  Row(
                    children: [
                      Expanded(child: Text(
                          product.title,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ]),
                  
                  const SizedBox(height: 12),

                  // Price info
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      if (product.originalPrice != null)
                        Text(
                          '\$${product.originalPrice!.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      const SizedBox(width: 8),
                      if (product.discountPercentage > 0)
                        Text(
                          'Save ${product.discountPercentage.toInt()}%',
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Product description
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          product.description,
                          style: TextStyle(
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios, size: 14),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Enquiry button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Enquiry'),
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Color options
                  if (product.colors != null && product.colors!.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          children: product.colors!.map((color) {
                            bool isSelected = color == selectedColor;
                            return ChoiceChip(
                              label: Text('Color: $color'),
                              selected: isSelected,
                              backgroundColor: Colors.grey[200],
                              selectedColor: Colors.black,
                              labelStyle: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                              onSelected: (selected) {
                                setState(() {
                                  selectedColor = color;
                                });
                              },
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  
                  const SizedBox(height: 24),
                  
                  // Add to Cart and Checkout Buttons
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: addToCart,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('Add to Cart'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: checkout,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('Checkout'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 5,
        color: Colors.grey[300],
        alignment: Alignment.center,
        child: Container(
          height: 5,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}