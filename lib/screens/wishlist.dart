import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_user/Providers/wishlist_provider.dart';
import 'package:shop_user/constants/assets.dart';
import 'package:shop_user/services/app_methods.dart';
import 'package:shop_user/widgets/empty_screen.dart';
import 'package:shop_user/widgets/product_item.dart';
import 'package:shop_user/widgets/title_text.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  static const routName = '/Whishlist';

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return Scaffold(
      body: wishlistProvider.getWishlistItems.isEmpty
          ? const EmptyScreen(
              imagePath: Assets.imagesBagBagWish,
              title: 'your wishlist is empty',
              subtilte:
                  'Looks like you did not add item yet, \n go ahead and shop now',
              buttonText: 'shop now',
            )
          : Scaffold(
              appBar: AppBar(
                title: TitleText(
                    label:
                        'Wishlist (${wishlistProvider.getWishlistItems.length})'),
                actions: [
                  IconButton(
                    onPressed: () {
                      AppMethods.alertDialog(
                          
                          context: context,
                          label: 'clear your wishlist',
                          function: () {
                            wishlistProvider.clearWishList();
                          });
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
              body: DynamicHeightGridView(
                itemCount: wishlistProvider.getWishlistItems.length,
                builder: (context, index) {
                  return ProductItem(
                    productID: wishlistProvider.getWishlistItems.values
                        .toList()[index]
                        .productID,
                  );
                },
                crossAxisCount: 2,
              ),
            ),
    );
  }
}
