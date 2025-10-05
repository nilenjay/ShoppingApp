import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/cart_service.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  final CartService cartService = CartService();

  ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(product.image, height: 200),
            const SizedBox(height: 16),
            Text(product.title, style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 8),
            Text("\$${product.price}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text(product.description),
            const Spacer(),
            ElevatedButton(
              onPressed: () async {
                await cartService.addToCart(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Added to cart")),
                );
              },
              child: const Text("Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
