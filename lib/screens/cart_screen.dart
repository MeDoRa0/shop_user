import 'package:flutter/material.dart';
import 'package:shop_user/constants/assets.dart';
import 'package:shop_user/widgets/cart_widget.dart';
import 'package:shop_user/widgets/empty_cart.dart';
import 'package:shop_user/widgets/title_text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isEmpty
          ? const EmptyScreen(
              imagePath: Assets.imagesBagShoppingCart,
              title: 'your cart is empty',
              subtilte:
                  'Looks like you did not add item yet, \n go ahead and shop now',
              buttonText: 'shop now',
            )
          : Scaffold(
              appBar: AppBar(
                title: const TitleText(label: 'Cart'),
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(Assets.imagesBagShoppingCart),
                ),
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
                ],
              ),
              body: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const CartWidget();
                },
              ),
            ),
    );
  }
}
