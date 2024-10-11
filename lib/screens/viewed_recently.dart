import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:shop_user/constants/assets.dart';
import 'package:shop_user/widgets/empty_screen.dart';
import 'package:shop_user/widgets/product_item.dart';
import 'package:shop_user/widgets/title_text.dart';

class ViewedRecently extends StatelessWidget {
  const ViewedRecently({super.key});
  final bool isEmpty = true;
  static const routName = '/Viewed_recently';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isEmpty
          ? const EmptyScreen(
              imagePath: Assets.imagesBagOrder,
              title: 'your didn`t view items yet',
              subtilte: 'go discovre awesome items',
              buttonText: 'shop now',
            )
          : Scaffold(
              appBar: AppBar(
                title: const TitleText(label: 'viewed recently'),
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
