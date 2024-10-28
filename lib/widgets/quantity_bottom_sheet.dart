import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_user/Providers/cart_provider.dart';
import 'package:shop_user/models/cart_model.dart';
import 'package:shop_user/widgets/subtitle_text.dart';

class QuantityBottomSheet extends StatelessWidget {
  const QuantityBottomSheet({super.key, required this.cartModel});
  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Container(
          height: 6,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.grey),
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  cartProvider.updateQuantity(
                      productID: cartModel.productID, quantity: index + 1);
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: SubTitleText(label: '${index + 1}'),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
