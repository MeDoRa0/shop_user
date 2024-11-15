import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_user/Providers/product_provider.dart';
import 'package:shop_user/models/cart_model.dart';
import 'package:shop_user/models/product_model.dart';
import 'package:shop_user/services/app_methods.dart';
import 'package:uuid/uuid.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartModel> _cartItems = {};
  Map<String, CartModel> get getCartItems {
    return _cartItems;
  }

  //firebase

  final userDB = FirebaseFirestore.instance.collection('users');
  final _auth = FirebaseAuth.instance;
  Future<void> addToCartFirebase(
      {required String productID,
      required int quantity,
      required BuildContext context}) async {
    final User? user = _auth.currentUser;
    if (user == null) {
      AppMethods.errorDialog(
          context: context, label: 'no user found', function: () {});
      return;
    }
    final uid = user.uid;
    final cartId = Uuid().v4();

    try {
      userDB.doc(uid).update({
        'userCart': FieldValue.arrayUnion([
          {
            'cartId': cartId,
            'productId': productID,
            'quantity': quantity,
          }
        ])
      });
      await fetchCartFirebase();

      Fluttertoast.showToast(
          msg: 'item has benn added to your cart',
          backgroundColor: Colors.green);
    } catch (e) {
      rethrow;
    }
  }

  //fetch cart from firebase

  Future<void> fetchCartFirebase() async {
    User? user = _auth.currentUser;
    if (user == null) {
      _cartItems.clear();
      return;
    }
    try {
      final userDoc = await userDB.doc(user.uid).get();
      final data = userDoc.data();
      //this we check if the cart is null or there is no cart created for user yet
      if (data == null || !data.containsKey('userCart')) {
        return;
      }
      final length = userDoc.get('userCart').length;
      for (int index = 0; index < length; index++) {
        _cartItems.putIfAbsent(
            userDoc.get('userCart')[index]['productId'],
            () => CartModel(
                  cartID: userDoc.get('userCart')[index]['cartId'],
                  productID: userDoc.get('userCart')[index]['productId'],
                  quantity: userDoc.get('userCart')[index]['quantity'],
                ));
      }
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  Future<void> clearCartFirebase() async {
    User? user = _auth.currentUser;
    try {
      await userDB.doc(user!.uid).update({
        'userCart': [],
      });
      _cartItems.clear();
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  Future<void> removeItemFromCartFirebase({
    required String cartId,
    required String productID,
    required int quantity,
  }) async {
    User? user = _auth.currentUser;
    try {
      await userDB.doc(user!.uid).update({
        'userCart': FieldValue.arrayRemove([
          {
            'cartId': cartId,
            'productId': productID,
            'quantity': quantity,
          }
        ]),
      });
      _cartItems.remove(productID);
      await fetchCartFirebase();
      Fluttertoast.showToast(
          msg: 'item has benn removed from your cart',
          backgroundColor: Colors.red);
    } catch (e) {
      rethrow;
    }
    notifyListeners();
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
