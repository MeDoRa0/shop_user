import 'package:flutter/material.dart';
import 'package:shop_user/models/wishlist_model.dart';
import 'package:uuid/uuid.dart';

class WishlistProvider with ChangeNotifier {
  final Map<String, WishlistModel> _wishListItems = {};
  Map<String, WishlistModel> get getWishlistItems {
    return _wishListItems;
  }

  //this code to check wether the item is in wishlistt or not
  bool isProductInWishlist({required String productID}) {
    return _wishListItems.containsKey(productID);
  }

  void addOrRemoveWishlist({required String productID}) {
    if (_wishListItems.containsKey(productID)) {
      _wishListItems.remove(productID);
    } else {
      //putIfAbsent is used to add the product to cart if it is not in wishlist
      _wishListItems.putIfAbsent(
        productID,
        () => WishlistModel(id: const Uuid().v4(), productID: productID),
      );
    }

    notifyListeners();
  }

  void clearWishList() {
    _wishListItems.clear();
    notifyListeners();
  }
}
