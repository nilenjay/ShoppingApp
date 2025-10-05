import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final Map<int, int> _cart = {}; // productId : quantity

  Map<int, int> get cart => _cart;

  void addToCart(Product product) {
    if (_cart.containsKey(product.id)) {
      _cart[product.id] = _cart[product.id]! + 1;
    } else {
      _cart[product.id] = 1;
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    if (_cart.containsKey(product.id) && _cart[product.id]! > 1) {
      _cart[product.id] = _cart[product.id]! - 1;
    } else {
      _cart.remove(product.id);
    }
    notifyListeners();
  }

  int getQuantity(Product product) {
    return _cart[product.id] ?? 0;
  }
}
