import 'package:flutter/material.dart';
import 'package:shop_user/constants/theme_data.dart';
import 'package:shop_user/screens/home.dart';

void main() {
  runApp(const ShopUser());
}

class ShopUser extends StatelessWidget {
  const ShopUser({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: Styles.themeData(isDarkTheme: false, context: context),
      title: 'shop user',
      home: HomeScreen(),
    );
  }
}
