import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_user/models/product_model.dart';
import 'package:shop_user/screens/inner_screens/product_details.dart';
import 'package:shop_user/widgets/add_to_favorit.dart';
import 'package:shop_user/widgets/subtitle_text.dart';
import 'package:shop_user/widgets/title_text.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final productModelProvider = Provider.of<ProductModel>(context);
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () async {
        await Navigator.pushNamed(context, ProductDetails.routName);
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
              imageUrl: productModelProvider.productImage,
              width: double.infinity,
              height: size.height * 0.22,
            ),
            Row(
              children: [
                Flexible(
                  child: TitleText(
                    label: productModelProvider.productTitle,
                    maxLines: 2,
                  ),
                ),
                const AddToFavorit(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: SubTitleText(
                      label: '${productModelProvider.productPrice}'),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_shopping_cart),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
