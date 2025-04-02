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
  String selectedShipping = 'Standard';

  @override
  void initState() {
    super.initState();
    cart = Cart.sampleCart;
    selectedAddress = UserProfile.sampleUser.addresses.first;
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection('PRICE BREAKDOWN', [
              _buildPriceRow('Subtotal', cart.subtotal),
              _buildPriceRow('Discount', -cart.calculateDiscount()),
              _buildPriceRow('Tax', cart.calculateTax()),
              _buildPriceRow('Shipping', cart.calculateShipping()),
              const Divider(height: 24),
              _buildPriceRow('TOTAL', cart.total, isTotal: true),
            ]),
            const SizedBox(height: 24),
            _buildSection('DELIVERY ADDRESS', [
              Text('${selectedAddress.street}, ${selectedAddress.city}'),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: _changeAddress,
                child: const Text('CHANGE ADDRESS'),
              ),
            ]),
            const SizedBox(height: 24),
            _buildSection('SHIPPING METHOD', [
              RadioListTile(
                title: const Text('Standard Shipping'),
                value: 'Standard',
                groupValue: selectedShipping,
                onChanged: (value) => setState(() => selectedShipping = value!),
              ),
              RadioListTile(
                title: const Text('Express Shipping'),
                value: 'Express',
                groupValue: selectedShipping,
                onChanged: (value) => setState(() => selectedShipping = value!),
              ),
            ]),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _placeOrder,
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('PLACE ORDER'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }

  Widget _buildPriceRow(String label, double amount, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: isTotal ? Theme.of(context).textTheme.titleMedium : null),
          Text('\$${amount.toStringAsFixed(2)}',
              style: isTotal ? Theme.of(context).textTheme.titleMedium : null),
        ],
      ),
    );
  }

  void _changeAddress() {
    // Address change logic
  }

  void _placeOrder() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Order placed successfully!')),
    );
    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
  }
}
