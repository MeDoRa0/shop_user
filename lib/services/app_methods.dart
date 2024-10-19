import 'package:flutter/material.dart';
import 'package:shop_user/constants/assets.dart';
import 'package:shop_user/widgets/subtitle_text.dart';
import 'package:shop_user/widgets/title_text.dart';

class AppMethods {
  static Future<void> logoutdialog({
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

  static Future<void> alertDialog({
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
                Assets.imagesWarning,
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
                child: const TitleText(label: 'ok'),
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<void> imagePickerDialog(
      {required BuildContext context,
      required Function cameraFT,
      required Function galleryFT,
      required Function removeFT}) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Center(
              child: TitleText(label: 'pick image'),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  TextButton.icon(
                    onPressed: () {
                      cameraFT();
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                    label: const Text('from camera'),
                    icon: const Icon(Icons.camera_alt),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      galleryFT();
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                    label: const Text('from gallary'),
                    icon: const Icon(Icons.photo),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      removeFT();
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                    label: const Text('remove picture'),
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
