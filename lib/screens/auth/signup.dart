import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_user/widgets/app_name_text.dart';
import 'package:shop_user/widgets/auth/pick_image.dart';
import 'package:shop_user/widgets/auth/register_form.dart';
import 'package:shop_user/widgets/subtitle_text.dart';
import 'package:shop_user/widgets/title_text.dart';

class SignupScreen extends StatefulWidget {
  static const routName = '/RegisterScreen';
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  XFile? _pickedImage;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 64,
                ),
                const AppNameText(),
                const SizedBox(
                  height: 16,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TitleText(label: 'Welcome '),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child:
                        SubTitleText(label: 'you are in right place to shop'),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: size.height * 0.2,
                  width: size.width * 0.3,
                  child: PickImage(
                    function: () {},
                    pickedImage: _pickedImage,
                  ),
                ),
                const SizedBox(height: 16),
                const RegisterForm(),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
