import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_user/Providers/cart_provider.dart';
import 'package:shop_user/constants/assets.dart';
import 'package:shop_user/widgets/bottom_checkout.dart';
import 'package:shop_user/widgets/cart_widget.dart';
import 'package:shop_user/widgets/empty_screen.dart';
import 'package:shop_user/widgets/title_text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return cartProvider.getCartItems.isEmpty
        ? const Scaffold(
            body: EmptyScreen(
              imagePath: Assets.imagesBagShoppingCart,
              title: 'your cart is empty',
              subtilte:
                  'Looks like you did not add item yet, \n go ahead and shop now',
              buttonText: 'shop now',
            ),
          )
        : Scaffold(
            bottomSheet: const BottomCheckout(),
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
              itemCount: cartProvider.getCartItems.length,
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                  value: cartProvider.getCartItems.values.toList()[index],
                  child: const CartWidget(),
                );
              },
            ),
          );
  }
}
