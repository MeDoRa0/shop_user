import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_user/Providers/cart_provider.dart';
import 'package:shop_user/Providers/product_provider.dart';
import 'package:shop_user/widgets/subtitle_text.dart';
import 'package:shop_user/widgets/title_text.dart';

class BottomCheckout extends StatelessWidget {
  const BottomCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: const Border(
          top: BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
      ),
      child: SizedBox(
        height: kBottomNavigationBarHeight + 16,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleText(
                      label:
                          'Total (${cartProvider.getCartItems.length} products : ${cartProvider.getQuantity()} items)'),
                  SubTitleText(
                    label:
                        '\$${cartProvider.getTotal(productProvider: productProvider)}',
                    color: Colors.blue,
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                child: const SubTitleText(
                  label: 'Checkout',
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
