import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_user/Providers/product_provider.dart';
import 'package:shop_user/constants/app_constants.dart';
import 'package:shop_user/constants/assets.dart';
import 'package:shop_user/widgets/app_name_text.dart';
import 'package:shop_user/widgets/categories_widget.dart';
import 'package:shop_user/widgets/home_banners.dart';
import 'package:shop_user/widgets/latest_arrival.dart';
import 'package:shop_user/widgets/title_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routName = '/Home';

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const AppNameText(),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(Assets.imagesBagShoppingCart),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeBannars(),
            const SizedBox(
              height: 16,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: TitleText(label: 'Latest arrival'),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
                height: size.height * 0.2,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider.value(
                          value: productProvider.getProducts[index],
                          child: LatestArrival(
                            productID:
                                productProvider.getProducts[index].productID,
                          ));
                    })),
            const SizedBox(
              height: 16,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: TitleText(label: 'Categories'),
            ),
            const SizedBox(
              height: 16,
            ),
            GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                children: List.generate(
                  AppConstants.categoriesList.length,
                  (index) {
                    return CategoriesWidget(
                        image: AppConstants.categoriesList[index].image,
                        name: AppConstants.categoriesList[index].name);
                  },
                ))
          ],
        ),
      ),
    );
  }
}
