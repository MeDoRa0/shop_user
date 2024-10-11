import 'package:flutter/material.dart';
import 'package:shop_user/root_screen.dart';
import 'package:shop_user/screens/home.dart';
import 'package:shop_user/widgets/subtitle_text.dart';
import 'package:shop_user/widgets/title_text.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtilte,
    required this.buttonText,
  });

  final String imagePath, title, subtilte, buttonText;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: size.height * 0.35,
              width: double.infinity,
            ),
            const TitleText(
              label: 'whoops',
              fontSize: 40,
              color: Colors.red,
            ),
            const SizedBox(
              height: 16,
            ),
            SubTitleText(
              label: title,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SubTitleText(
                label: subtilte,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
              onPressed: () async {
                await Navigator.pushNamed(context, RootScreen.routName);
              },
              child: Text(
                buttonText,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
