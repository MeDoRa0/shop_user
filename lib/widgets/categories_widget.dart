import 'package:flutter/material.dart';
import 'package:shop_user/widgets/subtitle_text.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
    required this.image,
    required this.name,
  });
  final String image, name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          height: 50,
          width: 50,
        ),
        const SizedBox(
          height: 10,
        ),
        SubTitleText(
          label: name,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
