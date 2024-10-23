import 'package:flutter/material.dart';
import 'package:shop_user/models/cart_model.dart';
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

  void updateQuantity({required String productID,required int quantity}) {
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
}
