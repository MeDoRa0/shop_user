import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_user/constants/app_colors.dart';
import 'package:shop_user/constants/app_constants.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const AppNameText(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FancyShimmerImage(
              imageUrl: AppConstants.productImageUrl,
              height: size.height * 0.35,
              width: double.infinity,
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: TitleText(
                          label: 'nike sneakers p05',
                          maxLines: null,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      SubTitleText(
                        label: '\$45',
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
                      const AddToFavorit(),
                      const SizedBox(
                        width: 16,
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        icon: const Icon(
                          Icons.add_shopping_cart,
                          color: AppColors.lightScafoldColor,
                        ),
                        onPressed: () {},
                        label: const SubTitleText(
                          label: 'add to cart',
                          color: AppColors.lightScafoldColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Row(
                    children: [TitleText(label: 'about this item :')],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const SubTitleText(
                      label:
                          'A pair of sleek blue sneakers designed for both style and comfort. The shoes feature a vibrant royal blue upper made from breathable mesh material, ensuring optimal ventilation during wear. The lightweight rubber sole provides excellent grip and durability, while the cushioned insole offers superior support for everyday use. Subtle detailing, such as matching blue laces and a streamlined design, gives the sneakers a modern and versatile look, perfect for casual outings, workouts, or running errands.')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
