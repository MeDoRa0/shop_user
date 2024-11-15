import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_user/models/wishlist_model.dart';
import 'package:shop_user/services/app_methods.dart';
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

  //firebase

  final userDB = FirebaseFirestore.instance.collection('users');
  final _auth = FirebaseAuth.instance;
  Future<void> addToWishlistFirebase(
      {required String productID, required BuildContext context}) async {
    final User? user = _auth.currentUser;
    if (user == null) {
      AppMethods.errorDialog(
          context: context, label: 'no user found', function: () {});
      return;
    }
    final uid = user.uid;
    final wishlisId = Uuid().v4();

    try {
      userDB.doc(uid).update({
        'userWishlist': FieldValue.arrayUnion([
          {
            'wishlistId': wishlisId,
            'productId': productID,
          }
        ])
      });
      await fetchWishlistFirebase();

      Fluttertoast.showToast(
          msg: 'item has benn added to your wishlist',
          backgroundColor: Colors.green);
    } catch (e) {
      rethrow;
    }
  }

  //fetch wishlist from firebase

  Future<void> fetchWishlistFirebase() async {
    User? user = _auth.currentUser;
    if (user == null) {
      _wishListItems.clear();
      return;
    }
    try {
      final userDoc = await userDB.doc(user.uid).get();
      final data = userDoc.data();
      //this we check if the wishlist is null or there is no wishlist created for user yet
      if (data == null || !data.containsKey('userWishlist')) {
        return;
      }
      final length = userDoc.get('userWishlist').length;
      for (int index = 0; index < length; index++) {
        _wishListItems.putIfAbsent(
          userDoc.get('userWishlist')[index]['productId'],
          () => WishlistModel(
            id: userDoc.get('userWishlist')[index]['wishlistId'],
            productID: userDoc.get('userWishlist')[index]['productId'],
          ),
        );
      }
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  Future<void> clearWishlistFirebase() async {
    User? user = _auth.currentUser;
    try {
      await userDB.doc(user!.uid).update({
        'userWishlist': [],
      });
      _wishListItems.clear();
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  Future<void> removeItemFromWishlistFirebase({
    required String wishlistId,
    required String productID,
  }) async {
    User? user = _auth.currentUser;
    try {
      await userDB.doc(user!.uid).update({
        'userWishlist': FieldValue.arrayRemove([
          {
            'wishlistId': wishlistId,
            'productId': productID,
          }
        ]),
      });
      _wishListItems.remove(productID);
      await fetchWishlistFirebase();
      Fluttertoast.showToast(
          msg: 'item has benn removed from your wishlist',
          backgroundColor: Colors.red);
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  void addOrRemoveWishlist({required String productID}) {
    if (_wishListItems.containsKey(productID)) {
      _wishListItems.remove(productID);
    } else {
      //putIfAbsent is used to add the product to wishlist if it is not in wishlist
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
