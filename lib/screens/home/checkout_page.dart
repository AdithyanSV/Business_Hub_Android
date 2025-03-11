import 'package:flutter/material.dart';
import '../../models/product.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  late Cart cart;
  late Address selectedAddress;
  String selectedShippingMethod = 'Standard Shipping';
  
  @override
  void initState() {
    super.initState();
    cart = Cart.sampleCart;
    selectedAddress = UserProfile.sampleUser.addresses.firstWhere(
      (address) => address.isDefault,
      orElse: () => UserProfile.sampleUser.addresses.first,
    );
  }
  
  void placeOrder() {
    // Order placement logic would go here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Order placed successfully!')),
    );
    // Navigate to order confirmation page or back to home
    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Price breakdown section
              const Text(
                'Price Breakdown',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildPriceRow('Subtotal:', cart.subtotal),
              _buildPriceRow('Discount:', -cart.calculateDiscount()),
              _buildPriceRow('Taxes:', cart.calculateTax()),
              _buildPriceRow('Shipping Fees:', cart.calculateShipping()),
              const Divider(height: 32),
              _buildPriceRow('Total:', cart.total, isBold: true),
              
              const SizedBox(height: 32),
              
              // Delivery location section
              const Text(
                'Delivery Location',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '${selectedAddress.street}, ${selectedAddress.buildingInfo}, ${selectedAddress.city}, ${selectedAddress.state} ${selectedAddress.zipCode}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () {
                  // Navigate to address selection
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.grey[300]!),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Change Address'),
              ),
              
              const SizedBox(height: 32),
              
              // Delivery method section
              const Text(
                'Delivery Method',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              RadioListTile<String>(
                title: const Text('Standard Shipping'),
                subtitle: Text('\$${cart.calculateShipping().toStringAsFixed(2)}'),
                value: 'Standard Shipping',
                groupValue: selectedShippingMethod,
                onChanged: (value) {
                  setState(() {
                    selectedShippingMethod = value!;
                  });
                },
                contentPadding: EdgeInsets.zero,
              ),
              RadioListTile<String>(
                title: const Text('Express Shipping'),
                subtitle: const Text('\$XX.XX'),
                value: 'Express Shipping',
                groupValue: selectedShippingMethod,
                onChanged: (value) {
                  setState(() {
                    selectedShippingMethod = value!;
                  });
                },
                contentPadding: EdgeInsets.zero,
              ),
              
              const SizedBox(height: 32),
              
              // Place Order button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$${cart.total.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: placeOrder,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Place Order'),
                ),
              ),
            ],
          ),
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
  
  Widget _buildPriceRow(String label, double amount, {bool isBold = false}) {
    final style = isBold 
        ? const TextStyle(fontSize: 16, fontWeight: FontWeight.bold) 
        : const TextStyle(fontSize: 16);
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          Text(
            '\$${amount.toStringAsFixed(2)}',
            style: style,
          ),
        ],
      ),
    );
  }
}