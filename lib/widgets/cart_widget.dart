import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_user/constants/app_constants.dart';
import 'package:shop_user/widgets/add_to_favorit.dart';
import 'package:shop_user/widgets/quantity_bottom_sheet.dart';
import 'package:shop_user/widgets/subtitle_text.dart';
import 'package:shop_user/widgets/title_text.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FittedBox(
      child: IntrinsicWidth(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              FancyShimmerImage(
                imageUrl: AppConstants.productImageUrl,
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
                            label: 'item name' * 10,
                            maxLines: 2,
                          ),
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
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
                        const SubTitleText(
                          label: '\$28',
                          fontSize: 20,
                        ),
                        OutlinedButton.icon(
                          onPressed: () async {
                            await showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              context: context,
                              builder: (context) {
                                return const QuantityBottomSheet();
                              },
                            );
                          },
                          label: const Text('Qty (7)'),
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
