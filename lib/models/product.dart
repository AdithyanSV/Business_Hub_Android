class Product {
  final String title;
  final double price;
  final String? imageUrl;
  final String category;
  
  Product({
    required this.title,
    required this.price,
    this.imageUrl,
    required this.category,
  });
  
  // Sample products data
  static List<Product> sampleProducts = [
    Product(title: 'Smartphone', price: 299, category: 'Electronics'),
    Product(title: 'Kitchen Blender', price: 49, category: 'Home & Garden'),
    Product(title: 'Bluetooth Speaker', price: 89, category: 'Electronics'),
    Product(title: 'Organic Coffee', price: 15, category: 'Food & Drink'),
    Product(title: 'Face Cream', price: 25, category: 'Beauty'),
    Product(title: 'Wireless Earbuds', price: 99, category: 'Electronics'),
    Product(title: 'Hair Clips', price: 9, category: 'Beauty'),
    Product(title: 'Backpack', price: 19, category: 'Fashion'),
  ];
  
  // Get products by category
  static List<Product> getByCategory(String category) {
    if (category == 'All') {
      return sampleProducts;
    }
    return sampleProducts.where((product) => product.category == category).toList();
  }
}
