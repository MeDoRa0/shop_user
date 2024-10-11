import 'package:flutter/material.dart';
import 'package:shop_user/constants/assets.dart';
import 'package:shop_user/widgets/subtitle_text.dart';
import 'package:shop_user/widgets/title_text.dart';

class AppMethods {
  static Future<void> customShowdialog({
    required BuildContext context,
    required String label,
    required Function function,
    bool isError = false,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                Assets.imagesProfileLogout,
                height: 60,
                width: 60,
              ),
              const SizedBox(
                height: 16,
              ),
              SubTitleText(
                label: label,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
          actions: [
            Visibility(
              visible: !isError,
              child: TextButton(
                onPressed: () {
                  function();
                  Navigator.pop(context);
                },
                child: const TitleText(label: 'yes'),
              ),
            ),
            Visibility(
              visible: !isError,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const TitleText(label: 'no'),
              ),
            ),
          ],
        );
      },
    );
  }
}
