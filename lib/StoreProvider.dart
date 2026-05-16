import 'package:flutter/material.dart';
import 'package:online_store/Model.dart';

class StoreProvider extends ChangeNotifier {
  final List<Product> _favoriteProducts = [];
  final List<CartItem> _cartItems = [];

  List<Product> get favoriteProducts => _favoriteProducts;
  List<CartItem> get cartItems => _cartItems;

  void toggleFavorite(Product product) {
    final isExist = _favoriteProducts.any((p) => p.id == product.id);
    if (isExist) {
      _favoriteProducts.removeWhere((p) => p.id == product.id);
    } else {
      _favoriteProducts.add(product);
    }
    notifyListeners();
  }

  bool isFavorite(Product product) {
    return _favoriteProducts.any((p) => p.id == product.id);
  }

  void addToCart(Product product) {
    final isExist = _cartItems.any((item) => item.product.id == product.id);
    if (isExist) {
      final index = _cartItems.indexWhere((item) => item.product.id == product.id);
      _cartItems[index].quantity++;
    } else {
      _cartItems.add(CartItem(product: product, quantity: 1));
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartItems.removeWhere((item) => item.product.id == product.id);
    notifyListeners();
  }

  void decreaseCartItem(Product product) {
    final index = _cartItems.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      if (_cartItems[index].quantity > 1) {
        _cartItems[index].quantity--;
      } else {
        _cartItems.removeAt(index);
      }
      notifyListeners();
    }
  }

  double get cartTotal {
    return _cartItems.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
  }
}
