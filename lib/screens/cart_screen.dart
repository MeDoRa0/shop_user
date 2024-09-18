import 'package:flutter/material.dart';
import 'package:shop_user/widgets/title_text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(
        child: TitleText(label: 'Cart Screen'),
      ),
    );
  }
}