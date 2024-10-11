import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:shop_user/constants/assets.dart';
import 'package:shop_user/widgets/empty_cart.dart';
import 'package:shop_user/widgets/product_item.dart';
import 'package:shop_user/widgets/title_text.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});
  final bool isEmpty = false;
  static const routName = '/Whishlist';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isEmpty
          ? const EmptyScreen(
              imagePath: Assets.imagesBagShoppingCart,
              title: 'your wishlist is empty',
              subtilte:
                  'Looks like you did not add item yet, \n go ahead and shop now',
              buttonText: 'shop now',
            )
          : Scaffold(
              appBar: AppBar(
                title: const TitleText(label: 'Wishlist'),
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(Assets.imagesBagShoppingCart),
                ),
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
                ],
              ),
              body: DynamicHeightGridView(
                itemCount: 222,
                builder: (context, index) {
                  return const ProductItem();
                },
                crossAxisCount: 2,
              ),
            ),
    );
  }
}
