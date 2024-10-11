
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_user/constants/app_constants.dart';
import 'package:shop_user/screens/inner_screens/product_details.dart';
import 'package:shop_user/widgets/subtitle_text.dart';

class LatestArrival extends StatelessWidget {
  const LatestArrival({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
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
                        imageUrl: AppConstants.productImageUrl,
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
                              'nike sneakers p05' * 10,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            FittedBox(
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.favorite,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.add_shopping_cart,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const FittedBox(
                              child: SubTitleText(
                                label: '\$45',
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
        },
      ),
    );
  }
}
