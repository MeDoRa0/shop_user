import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  final String userID, userName, userImage, userEmail;
  final Timestamp createdAt;
  final List userCart, userWishlist;

  UserModel({
    required this.userID,
    required this.userName,
    required this.userImage,
    required this.userEmail,
    required this.createdAt,
    required this.userCart,
    required this.userWishlist,
  });
}
