import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_user/Providers/cart_provider.dart';
import 'package:shop_user/Providers/product_provider.dart';
import 'package:shop_user/constants/app_colors.dart';

import 'package:shop_user/widgets/add_to_favorit.dart';
import 'package:shop_user/widgets/app_name_text.dart';
import 'package:shop_user/widgets/subtitle_text.dart';
import 'package:shop_user/widgets/title_text.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});
  static const routName = '/ProductDetails';

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
  
    final poductProvider = Provider.of<ProductProvider>(context, listen: false);
    final productID = ModalRoute.of(context)!.settings.arguments as String;
    final getCurrentProduct = poductProvider.findByProdId(productID);
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const AppNameText(),
        centerTitle: true,
      ),
      body: getCurrentProduct == null
          ? const SizedBox.shrink()
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    FancyShimmerImage(
                      imageUrl: getCurrentProduct.productImage,
                      height: size.height * 0.45,
                      width: double.infinity,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(
                                child: TitleText(
                                  label: getCurrentProduct.productTitle,
                                  maxLines: null,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              SubTitleText(
                                label:
                                    "\$${getCurrentProduct.productPrice.toString()}",
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AddToFavorit(
                                productID: getCurrentProduct.productID,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: cartProvider.isProductInCart(
                                          productID: productID)
                                      ? Colors.green
                                      : Colors.blue,
                                ),
                                icon: Icon(
                                  cartProvider.isProductInCart(
                                          productID: productID)
                                      ? Icons.shopping_cart
                                      : Icons.add_shopping_cart,
                                  color: AppColors.lightScafoldColor,
                                ),
                                onPressed: () {
                                  if (cartProvider.isProductInCart(
                                      productID: getCurrentProduct.productID)) {
                                    return;
                                  }
                                  cartProvider.addProductTocart(
                                      productID: getCurrentProduct.productID);
                                },
                                label: SubTitleText(
                                  label: cartProvider.isProductInCart(
                                          productID: productID)
                                      ? 'in your cart'
                                      : 'add to cart',
                                  color: AppColors.lightScafoldColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const TitleText(label: 'about this item: '),
                              SubTitleText(
                                  label: getCurrentProduct.productCategory)
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SubTitleText(
                              label: getCurrentProduct.productDescription),
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
