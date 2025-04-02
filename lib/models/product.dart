class Product {
  final String id;
  final String title;
  final double price;
  final double? originalPrice;
  final String? imageUrl;
  final String category;
  final String description;
  final List<String>? colors;
  final Map<String, List<String>>? variants;
  final double? rating;
  final int? reviewCount;

  Product({
    required this.id,
    required this.title,
    required this.price,
    this.originalPrice,
    this.imageUrl,
    required this.category,
    this.description = '',
    this.colors,
    this.variants,
    this.rating,
    this.reviewCount,
  });

  double get discountPercentage {
    if (originalPrice == null || originalPrice! <= price) return 0;
    return ((originalPrice! - price) / originalPrice! * 100).round().toDouble();
  }

  // Sample products data
  static List<Product> sampleProducts = [
    Product(
      id: 'p1',
      title: 'Smartphone',
      price: 299,
      originalPrice: 349,
      category: 'Electronics',
      description: 'Latest model with advanced features and long battery life',
      colors: ['Black', 'White', 'Blue'],
      rating: 4.5,
      reviewCount: 128,
    ),
    Product(
      id: 'p2',
      title: 'Kitchen Blender',
      price: 49,
      originalPrice: 69.99,
      category: 'Home & Garden',
      description: 'Powerful motor with multiple speed settings',
      colors: ['Red', 'Black', 'Silver'],
      rating: 4.2,
      reviewCount: 86,
    ),
    Product(
      id: 'p3',
      title: 'Bluetooth Speaker',
      price: 89,
      originalPrice: 129.99,
      category: 'Electronics',
      description: 'Premium sound quality with 24-hour battery life',
      colors: ['Black', 'Blue', 'Red'],
      rating: 4.7,
      reviewCount: 214,
    ),
    Product(
      id: 'p4',
      title: 'Organic Coffee',
      price: 15,
      originalPrice: 18.99,
      category: 'Food & Drink',
      description: 'Ethically sourced premium coffee beans',
      variants: {
        'Size': ['250g', '500g', '1kg']
      },
      rating: 4.8,
      reviewCount: 156,
    ),
    Product(
      id: 'p5',
      title: 'Face Cream',
      price: 25,
      originalPrice: 34.99,
      category: 'Beauty',
      description: 'Hydrating formula with natural ingredients',
      variants: {
        'Size': ['50ml', '100ml']
      },
      rating: 4.3,
      reviewCount: 92,
    ),
    Product(
      id: 'p6',
      title: 'Wireless Earbuds',
      price: 99,
      originalPrice: 129.99,
      category: 'Electronics',
      description: 'True wireless with noise cancellation and water resistance',
      colors: ['Black', 'White'],
      rating: 4.6,
      reviewCount: 178,
    ),
    Product(
      id: 'p7',
      title: 'Hair Clips',
      price: 9,
      originalPrice: 12.99,
      category: 'Beauty',
      description: 'Set of 6 stylish clips in various colors',
      rating: 4.0,
      reviewCount: 45,
    ),
    Product(
      id: 'p8',
      title: 'Backpack',
      price: 19,
      originalPrice: 29.99,
      category: 'Fashion',
      description: 'Durable material with multiple compartments',
      colors: ['Black', 'Blue', 'Gray'],
      rating: 4.4,
      reviewCount: 112,
    ),
  ];

  // Get products by category
  static List<Product> getByCategory(String category) {
    if (category == 'All') {
      return sampleProducts;
    }
    return sampleProducts
        .where((product) => product.category == category)
        .toList();
  }

  // Get product by ID
  static Product getById(String id) {
    return sampleProducts.firstWhere(
      (product) => product.id == id,
      orElse: () => sampleProducts[0],
    );
  }
}

class UserProfile {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final List<Address> addresses;
  final List<PaymentMethod> paymentMethods;
  final List<Order> orderHistory;
  final List<String> wishlist;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.addresses,
    required this.paymentMethods,
    required this.orderHistory,
    required this.wishlist,
  });

  // Sample user data
  static UserProfile sampleUser = UserProfile(
    id: 'user1',
    name: 'John Doe',
    email: 'john.doe@example.com',
    phoneNumber: '+1 (555) 123-4567',
    addresses: [
      Address(
        id: 'addr1',
        street: '123 Main Street',
        buildingInfo: 'Building 4B',
        city: 'Anytown',
        state: 'IN',
        zipCode: '68022',
        isDefault: true,
      ),
      Address(
        id: 'addr2',
        street: '456 Oak Avenue',
        buildingInfo: 'Apt 303',
        city: 'Othertown',
        state: 'CA',
        zipCode: '90210',
        isDefault: false,
      ),
    ],
    paymentMethods: [
      PaymentMethod(
        id: 'pm1',
        type: 'Credit Card',
        lastFourDigits: '4567',
        expiryDate: '09/26',
        isDefault: true,
      ),
      PaymentMethod(
        id: 'pm2',
        type: 'PayPal',
        email: 'john.doe@example.com',
        isDefault: false,
      ),
    ],
    orderHistory: [
      Order(
        id: 'ord1',
        date: DateTime.now().subtract(const Duration(days: 5)),
        status: 'Delivered',
        items: [Product.sampleProducts[0], Product.sampleProducts[3]],
        total: 314.0,
      ),
      Order(
        id: 'ord2',
        date: DateTime.now().subtract(const Duration(days: 30)),
        status: 'Delivered',
        items: [Product.sampleProducts[1], Product.sampleProducts[4]],
        total: 74.0,
      ),
    ],
    wishlist: ['p3', 'p6', 'p8'],
  );
}

class Address {
  final String id;
  final String street;
  final String? buildingInfo;
  final String city;
  final String state;
  final String zipCode;
  final bool isDefault;

  Address({
    required this.id,
    required this.street,
    this.buildingInfo,
    required this.city,
    required this.state,
    required this.zipCode,
    this.isDefault = false,
  });

  String get formattedAddress {
    String address = street;
    if (buildingInfo != null && buildingInfo!.isNotEmpty) {
      address += ', $buildingInfo';
    }
    address += ', $city, $state $zipCode';
    return address;
  }
}

class PaymentMethod {
  final String id;
  final String type;
  final String? lastFourDigits;
  final String? expiryDate;
  final String? email;
  final bool isDefault;

  PaymentMethod({
    required this.id,
    required this.type,
    this.lastFourDigits,
    this.expiryDate,
    this.email,
    this.isDefault = false,
  });

  String get displayName {
    if (type == 'Credit Card' || type == 'Debit Card') {
      return '$type ending in $lastFourDigits';
    } else if (type == 'PayPal') {
      return 'PayPal - $email';
    }
    return type;
  }
}

class Order {
  final String id;
  final DateTime date;
  final String status;
  final List<Product> items;
  final double total;
  final String? trackingNumber;

  Order({
    required this.id,
    required this.date,
    required this.status,
    required this.items,
    required this.total,
    this.trackingNumber,
  });
}

class CartItem {
  final Product product;
  int quantity;
  final String? selectedColor;
  final String? selectedVariant;

  CartItem({
    required this.product,
    this.quantity = 1,
    this.selectedColor,
    this.selectedVariant,
  });

  double get total => product.price * quantity;
}

class Cart {
  final List<CartItem> items;

  Cart({required this.items});

  double get subtotal {
    return items.fold(0, (sum, item) => sum + item.total);
  }

  double calculateDiscount() {
    // Sample discount calculation
    if (subtotal > 100) {
      return subtotal * 0.1; // 10% discount for orders over $100
    }
    return 0;
  }

  double calculateTax() {
    // Sample tax calculation (7%)
    return subtotal * 0.07;
  }

  double calculateShipping() {
    // Sample shipping calculation
    if (subtotal > 50) {
      return 0; // Free shipping for orders over $50
    }
    return 5.99;
  }

  double get total {
    return subtotal -
        calculateDiscount() +
        calculateTax() +
        calculateShipping();
  }

  // Sample cart data
  static Cart sampleCart = Cart(items: [
    CartItem(product: Product.sampleProducts[0], quantity: 1),
    CartItem(product: Product.sampleProducts[1], quantity: 1),
    CartItem(product: Product.sampleProducts[2], quantity: 1),
    CartItem(product: Product.sampleProducts[3], quantity: 1),
    CartItem(product: Product.sampleProducts[4], quantity: 1),
    CartItem(product: Product.sampleProducts[5], quantity: 1),
  ]);
}
