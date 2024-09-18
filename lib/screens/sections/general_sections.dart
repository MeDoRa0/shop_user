import 'package:flutter/material.dart';
import 'package:shop_user/constants/assets.dart';
import 'package:shop_user/widgets/custom_list_tile.dart';
import 'package:shop_user/widgets/title_text.dart';

class GeneralSection extends StatelessWidget {
  const GeneralSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
//mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleText(label: 'General'),
        const SizedBox(
          height: 16,
        ),
        CustomListTile(
          icon: Assets.imagesBagOrderSvg,
          title: 'All Order',
          function: () {},
        ),
        CustomListTile(
          icon: Assets.imagesBagWishlistSvg,
          title: 'WishList',
          function: () {},
        ),
        CustomListTile(
          icon: Assets.imagesProfileRecent,
          title: 'Viewed resent',
          function: () {},
        ),
        CustomListTile(
          icon: Assets.imagesProfileAddress,
          title: 'Address',
          function: () {},
        ),
      ],
    );
  }
}
