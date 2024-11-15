import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_user/Providers/cart_provider.dart';
import 'package:shop_user/Providers/product_provider.dart';
import 'package:shop_user/Providers/viewd_recently_provider.dart';
import 'package:shop_user/models/product_model.dart';
import 'package:shop_user/screens/inner_screens/product_details.dart';
import 'package:shop_user/services/app_methods.dart';
import 'package:shop_user/widgets/add_to_favorit.dart';
import 'package:shop_user/widgets/subtitle_text.dart';

class LatestArrival extends StatelessWidget {
  const LatestArrival({super.key, required this.productID});
  final String productID;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final getCurrentProduct = productProvider.findByProdId(productID);
    final cartProvider = Provider.of<CartProvider>(context);
    final viewdRecentlyProvider = Provider.of<ViewdRecentlyProvider>(context);

    final productModel = Provider.of<ProductModel>(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: GestureDetector(
          onTap: () async {
            viewdRecentlyProvider.addToViewdRecently(
                productID: productModel.productID);
            await Navigator.pushNamed(context, ProductDetails.routName,
                arguments: productModel.productID);
          },
          child: SizedBox(
            width: size.width * 0.50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FancyShimmerImage(
                  imageUrl: productModel.productImage,
                  width: size.width * 0.28,
                  height: size.height * 0.28,
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productModel.productTitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      FittedBox(
                        child: Row(
                          children: [
                            AddToFavorit(productID: productModel.productID),
                            IconButton(
                              onPressed: () async {
                                if (cartProvider.isProductInCart(
                                    productID: getCurrentProduct!.productID)) {
                                  return;
                                }
                                //  cartProvider.addProductTocart(
                                //  productID: getCurrentProduct.productID);
                                try {
                                  await cartProvider.addToCartFirebase(
                                      productID: getCurrentProduct.productID,
                                      quantity: 1,
                                      context: context);
                                } catch (error) {
                                  AppMethods.errorDialog(
                                      context: context,
                                      label: error.toString(),
                                      function: () {});
                                }
                              },
                              icon: Icon(
                                cartProvider.isProductInCart(
                                        productID: productModel.productID)
                                    ? Icons.shopping_cart
                                    : Icons.add_shopping_cart,
                                color: cartProvider.isProductInCart(
                                        productID: productModel.productID)
                                    ? Colors.green
                                    : Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      FittedBox(
                        child: SubTitleText(
                          label: productModel.productPrice.toString(),
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
