import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product.dart';

class CartService {
  static const String cartKey = "user_cart";

  Future<void> addToCart(Product product) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> cartList = prefs.getStringList(cartKey) ?? [];
    cartList.add(jsonEncode(product.toJson()));
    await prefs.setStringList(cartKey, cartList);
  }

  Future<List<Product>> getCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> cartList = prefs.getStringList(cartKey) ?? [];
    return cartList.map((e) => Product.fromJson(jsonDecode(e))).toList();
  }

  Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(cartKey);
  }
}
