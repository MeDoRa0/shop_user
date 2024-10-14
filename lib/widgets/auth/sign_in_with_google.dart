import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_user/constants/app_colors.dart';
import 'package:shop_user/widgets/subtitle_text.dart';

class SignInWithGoogle extends StatelessWidget {
  const SignInWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(12),
        backgroundColor: Colors.grey,
      ),
      icon: const FaIcon(
        FontAwesomeIcons.google,
        color: Colors.red,
      ),
      onPressed: () {},
      label: const SubTitleText(
        label: 'Sign in with google',
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.lightScafoldColor,
      ),
    );
  }
}
