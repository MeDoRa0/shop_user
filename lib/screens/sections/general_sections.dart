import 'package:flutter/material.dart';
import 'package:shop_user/constants/assets.dart';
import 'package:shop_user/screens/inner_screens/orders/order_screen.dart';
import 'package:shop_user/screens/viewed_recently.dart';
import 'package:shop_user/screens/wishlist.dart';
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
          function: () async {
            await Navigator.pushNamed(context, OrderScreen.routName);
          },
        ),
        CustomListTile(
          icon: Assets.imagesBagWishlistSvg,
          title: 'WishList',
          function: () async {
            await Navigator.pushNamed(context, WishList.routName);
          },
        ),
        CustomListTile(
          icon: Assets.imagesProfileRecent,
          title: 'Viewed resent',
          function: () async {
            await Navigator.pushNamed(context, ViewedRecently.routName);
          },
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
