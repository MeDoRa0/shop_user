import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_user/Providers/product_provider.dart';
import 'package:shop_user/constants/assets.dart';
import 'package:shop_user/widgets/custom_text_field.dart';
import 'package:shop_user/widgets/product_item.dart';
import 'package:shop_user/widgets/title_text.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
      final productProvider = Provider.of<ProductProvider>(context);
    return GestureDetector(
      onTap: () {
        //this widget will enable the user to exit textfield if he press on screen
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const TitleText(
            label: 'Search',
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(Assets.imagesBagShoppingCart),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const CustomTextField(),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: DynamicHeightGridView(
                    itemCount: productProvider.getProducts.length,
                    builder: (context, index) {
                      return ChangeNotifierProvider.value(value: productProvider.getProducts[index],child: const ProductItem());
                    },
                    crossAxisCount: 2,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
