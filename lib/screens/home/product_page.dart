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
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    product = Product.getById(widget.productId);
    if (product.colors != null && product.colors!.isNotEmpty) {
      selectedColor = product.colors![0];
    }
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
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: Colors.grey[200],
                child: product.imageUrl != null
                    ? Image.network(product.imageUrl!, fit: BoxFit.cover)
                    : const Icon(Icons.image, size: 80, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.title,
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text('\$${product.price.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.titleLarge),
                      if (product.originalPrice != null) ...[
                        const SizedBox(width: 8),
                        Text('\$${product.originalPrice!.toStringAsFixed(2)}',
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey[600],
                            )),
                      ],
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(product.description,
                      style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: 24),
                  if (product.colors != null) ...[
                    Text('Colors',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: product.colors!.map((color) {
                        return ChoiceChip(
                          label: Text(color),
                          selected: selectedColor == color,
                          onSelected: (selected) {
                            setState(() => selectedColor = color);
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 24),
                  ],
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: _addToCart,
                          child: const Text('ADD TO CART'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _checkout,
                          child: const Text('BUY NOW'),
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
    );
  }

  void _addToCart() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Added to cart')),
    );
  }

  void _checkout() {
    Navigator.pushNamed(context, '/checkout');
  }
}
