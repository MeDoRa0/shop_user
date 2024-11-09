import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier {
  final String productID,
      productCategory,
      productTitle,
      productDescription,
      productImage,
      productQuantity;
  final double productPrice;
  Timestamp? createdAt;

  ProductModel(
      {required this.productID,
      required this.productCategory,
      this.createdAt,
      required this.productTitle,
      required this.productDescription,
      required this.productImage,
      required this.productQuantity,
      required this.productPrice});

  factory ProductModel.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return ProductModel(
      productID: data['productId'],
      productCategory: data['productCategory'],
      productTitle: data['productTitle'],
      productDescription: data['productDescription'],
      productImage: data['productImage'],
      productQuantity: data['productQuantity'],
      productPrice: double.parse(data['productPrice']),
    );
  }
}
