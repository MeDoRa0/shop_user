import 'package:flutter/material.dart';
import 'package:shop_user/widgets/subtitle_text.dart';
import 'package:shop_user/widgets/title_text.dart';

class BottomCheckout extends StatelessWidget {
  const BottomCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: const Border(
          top: BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
      ),
      child: SizedBox(
        height: kBottomNavigationBarHeight + 16,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleText(label: 'Total (7 items)'),
                  SubTitleText(
                    label: '\$1981',
                    color: Colors.blue,
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                child: const SubTitleText(
                  label: 'Checkout',
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
