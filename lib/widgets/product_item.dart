import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_user/Providers/cart_provider.dart';
import 'package:shop_user/Providers/product_provider.dart';
import 'package:shop_user/Providers/viewd_recently_provider.dart';
import 'package:shop_user/screens/inner_screens/product_details.dart';
import 'package:shop_user/widgets/add_to_favorit.dart';
import 'package:shop_user/widgets/subtitle_text.dart';
import 'package:shop_user/widgets/title_text.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productID});
  final String productID;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    final getCurrentProduct = productProvider.findByProdId(productID);
    final cartProvider = Provider.of<CartProvider>(context);

    final viewdRecentlyProvider = Provider.of<ViewdRecentlyProvider>(context);
    Size size = MediaQuery.of(context).size;
    return getCurrentProduct == null
        ? const SizedBox.shrink()
        : InkWell(
            onTap: () async {
              viewdRecentlyProvider.addToViewdRecently(
                  productID: getCurrentProduct.productID);
              await Navigator.pushNamed(
                context,
                ProductDetails.routName,
                arguments: getCurrentProduct.productID,
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  FancyShimmerImage(
                    imageUrl: getCurrentProduct.productImage,
                    width: double.infinity,
                    height: size.height * 0.22,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: TitleText(
                          label: getCurrentProduct.productTitle,
                          maxLines: 2,
                        ),
                      ),
                      AddToFavorit(productID: getCurrentProduct.productID),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: SubTitleText(
                            label: '${getCurrentProduct.productPrice}'),
                      ),
                      IconButton(
                        onPressed: () {
                          if (cartProvider.isProductInCart(
                              productID: getCurrentProduct.productID)) {
                            return;
                          }
                          cartProvider.addProductTocart(
                              productID: getCurrentProduct.productID);
                        },
                        icon: Icon(
                          cartProvider.isProductInCart(productID: productID)
                              ? Icons.shopping_cart
                              : Icons.add_shopping_cart,
                          color:
                              cartProvider.isProductInCart(productID: productID)
                                  ? Colors.green
                                  : Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
