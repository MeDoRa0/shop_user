import 'package:flutter/material.dart';

class ViewedRecentlyModel with ChangeNotifier {
   final String id, productID;

ViewedRecentlyModel({
    required this.id,
    required this.productID,
  });
}