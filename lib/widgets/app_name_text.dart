import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_user/constants/app_colors.dart';
import 'package:shop_user/widgets/title_text.dart';

class AppNameText extends StatelessWidget {
  const AppNameText({super.key, this.fontSize = 20});

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 10),
      baseColor: AppColors.lightPrimary,
      highlightColor: Colors.red,
      child: TitleText(
        label: 'Shop smart',
        fontSize: fontSize,
      ),
    );
  }
}
