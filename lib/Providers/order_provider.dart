import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_user/models/order_model.dart';

class OrderProvider with ChangeNotifier {
  final List<OrderModel> orders = [];
  List<OrderModel> get getOrders => orders;
  final userDB = FirebaseFirestore.instance.collection('users');
  final auth = FirebaseAuth.instance;


  
  Future<List<OrderModel>> fetchOrder() async {
    final auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    var uid = user!.uid;

    try {
      await FirebaseFirestore.instance.collection('ordersAdvanced').where('userId',isEqualTo: uid).get().then(
        (orderSnapshot) {
          orders.clear();
          for (var element in orderSnapshot.docs) {
            orders.insert(
              0,
              OrderModel(
                orderId: element.get('orderId'),
                userId: element.get('userId'),
                productId: element.get('productId'),
                productTitle: element.get('productTitle'),
                userName: element.get('userName'),
                price: element.get('price'),
                imageUrl: element.get('imageUrl'),
                quantity: element.get('quantity'),
                orderDate: element.get('orderDate'),
              ),
            );
          }
        },
      );
      return orders;
    } catch (error) {
      rethrow;
    }
  }

  

  /// Remove an order from both the app and Firebase
  Future<void> removeOrderFireBase(String orderId) async {
    try {
      // Remove from Firebase
      final querySnapshot = await FirebaseFirestore.instance
          .collection('ordersAdvanced')
          .where('orderId', isEqualTo: orderId)
          .get();

      for (var doc in querySnapshot.docs) {
        await doc.reference.delete();
      }

      // Remove locally
      orders.removeWhere((order) => order.orderId == orderId);
      
      Fluttertoast.showToast(
          msg: 'item has been removed from your orders',
          backgroundColor: Colors.yellow);
    } catch (error) {
      rethrow;
    }
    notifyListeners();
  }
}
