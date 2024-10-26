import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_user/Providers/cart_provider.dart';
import 'package:shop_user/Providers/product_provider.dart';
import 'package:shop_user/models/cart_model.dart';
import 'package:shop_user/widgets/add_to_favorit.dart';
import 'package:shop_user/widgets/quantity_bottom_sheet.dart';
import 'package:shop_user/widgets/subtitle_text.dart';
import 'package:shop_user/widgets/title_text.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartModelProvider = Provider.of<CartModel>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final getCurrentProduct =
        productProvider.findByProdId(cartModelProvider.productID);

    Size size = MediaQuery.of(context).size;
    return getCurrentProduct == null
        ? const SizedBox.shrink()
        : FittedBox(
            child: IntrinsicWidth(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    FancyShimmerImage(
                      imageUrl: getCurrentProduct.productImage,
                      height: size.height * 0.2,
                      width: size.width * 0.4,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    IntrinsicWidth(
                      child: Column(
                        children: [
                          //we wrap the text with SizedBox so we prevent the error could happen if the text is too long
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.5,
                                child: TitleText(
                                  label: getCurrentProduct.productTitle,
                                  maxLines: 2,
                                ),
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      cartProvider.removeOneItem(
                                          productID:
                                              getCurrentProduct.productID);
                                    },
                                    icon: const Icon(Icons.delete),
                                  ),
                                  const AddToFavorit()
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SubTitleText(
                                label: '\$${getCurrentProduct.productPrice}',
                                fontSize: 20,
                              ),
                              OutlinedButton.icon(
                                onPressed: () async {
                                  await showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    context: context,
                                    builder: (context) {
                                      return QuantityBottomSheet(
                                        cartModel: cartModelProvider,
                                      );
                                    },
                                  );
                                },
                                label:
                                    Text('Qty (${cartModelProvider.quantity})'),
                                icon: const Icon(Icons.arrow_drop_down),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
