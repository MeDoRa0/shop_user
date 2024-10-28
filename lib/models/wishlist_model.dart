import 'package:flutter/material.dart';

class WishlistModel with ChangeNotifier {
  final String id, productID;

  WishlistModel({
    required this.id,
    required this.productID,
  });
}
