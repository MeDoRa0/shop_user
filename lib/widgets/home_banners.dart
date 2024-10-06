import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:shop_user/constants/app_constants.dart';

class HomeBannars extends StatelessWidget {
  const HomeBannars({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.20,
      child: Swiper(
        autoplay: true,
        duration: 500,
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
    );
  }
}
