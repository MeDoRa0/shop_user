import 'package:flutter/material.dart';
import 'package:shop_user/Providers/product_provider.dart';
import 'package:shop_user/models/cart_model.dart';
import 'package:shop_user/models/product_model.dart';
import 'package:uuid/uuid.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartModel> _cartItems = {};
  Map<String, CartModel> get getCartItems {
    return _cartItems;
  }

  //this code to check wether the item is in cart or not
  bool isProductInCart({required String productID}) {
    return _cartItems.containsKey(productID);
  }

  void addProductTocart({required String productID}) {
    //putIfAbsent is used to add the product to cart if it is not in cart
    _cartItems.putIfAbsent(
      productID,
      () => CartModel(
          cartID: const Uuid().v4(), productID: productID, quantity: 1),
    );
    notifyListeners();
  }

  void updateQuantity({required String productID, required int quantity}) {
    _cartItems.update(
      productID,
      (item) => CartModel(
        cartID: item.cartID,
        productID: productID,
        quantity: quantity,
      ),
    );
    notifyListeners();
  }

  double getTotal({required ProductProvider productProvider}) {
    double total = 0.0;
    _cartItems.forEach(
      (key, value) {
        final ProductModel? getCurrentProduct =
            productProvider.findByProdId(value.productID);
        if (getCurrentProduct == null) {
          total + 0;
        } else {
          total += getCurrentProduct.productPrice * value.quantity;
        }
      },
    );
    return total;
  }

  void removeOneItem({required String productID}) {
    _cartItems.remove(productID);
    notifyListeners();
  }

  void clearLocalCart() {
    _cartItems.clear();
    notifyListeners();
  }

  int getQuantity() {
    int total = 0;
    _cartItems.forEach(
      (key, value) {
        total += value.quantity;
      },
    );
    return total;
  }
}
