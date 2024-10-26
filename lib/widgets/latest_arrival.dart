import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_user/models/product_model.dart';
import 'package:shop_user/screens/inner_screens/product_details.dart';
import 'package:shop_user/widgets/add_to_favorit.dart';
import 'package:shop_user/widgets/subtitle_text.dart';

class LatestArrival extends StatelessWidget {
  const LatestArrival({super.key});

  @override
  Widget build(BuildContext context) {
    
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
            await Navigator.pushNamed(context, ProductDetails.routName);
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
                            const AddToFavorit(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add_shopping_cart,
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
