import 'package:flutter/material.dart';
import 'package:shop_user/screens/home.dart';

void main() {
  runApp(const ShopUser());
}

class ShopUser extends StatelessWidget {
  const ShopUser({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'shop user',
      home: HomeScreen(),
    );
  }
}
