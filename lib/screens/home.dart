import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:shop_user/constants/app_constants.dart';
import 'package:shop_user/constants/assets.dart';
import 'package:shop_user/widgets/app_name_text.dart';
import 'package:shop_user/widgets/latest_arrival.dart';
import 'package:shop_user/widgets/title_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const AppNameText(),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(Assets.imagesBagShoppingCart),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.20,
            child: Swiper(
              autoplay: true,
              duration: 300,
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  AppConstants.bannarsImages[index],
                  fit: BoxFit.fill,
                );
              },
              itemCount: AppConstants.bannarsImages.length,
              pagination: const SwiperPagination(
                alignment: Alignment.bottomCenter,
                builder: DotSwiperPaginationBuilder(
                  color: Colors.grey,
                  activeColor: Colors.blue,
                ),
              ),
            ),
          ),
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
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const LatestArrival();
              },
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8),
            child: TitleText(label: 'Categories'),
          ),
        ],
      ),
    );
  }
}
