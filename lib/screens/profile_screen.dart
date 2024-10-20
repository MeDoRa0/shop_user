import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_user/Providers/theme_provider.dart';
import 'package:shop_user/constants/app_colors.dart';
import 'package:shop_user/constants/assets.dart';
import 'package:shop_user/screens/auth/login.dart';
import 'package:shop_user/screens/sections/general_sections.dart';
import 'package:shop_user/services/app_methods.dart';
import 'package:shop_user/widgets/app_name_text.dart';
import 'package:shop_user/widgets/subtitle_text.dart';
import 'package:shop_user/widgets/title_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const AppNameText(),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(Assets.imagesBagShoppingCart),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Visibility(
              visible: false,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: TitleText(label: 'Log in'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).cardColor,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.surface,
                          width: 3,
                        ),
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://e7.pngegg.com/pngimages/1000/665/png-clipart-computer-icons-profile-s-free-angle-sphere-thumbnail.png'))),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(label: 'Mohamed Hossam'),
                      SubTitleText(label: 'mohamed@mail.com')
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const GeneralSection(),
                  const Divider(
                    indent: 10,
                    endIndent: 10,
                  ),
                  const TitleText(label: 'Settings'),
                  const SizedBox(
                    height: 16,
                  ),
                  SwitchListTile(
                    secondary: Image.asset(
                      Assets.imagesProfileTheme,
                      height: 40,
                    ),
                    title: Text(themeProvider.getIsDarkTheme
                        ? 'Dark mode'
                        : 'Ligt mode'),
                    value: themeProvider.getIsDarkTheme,
                    onChanged: (value) {
                      themeProvider.setDarkTheme(themeValue: value);
                    },
                  ),
                  const Divider(
                    indent: 10,
                    endIndent: 10,
                  ),
                ],
              ),
            ),
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                icon: const Icon(
                  Icons.logout,
                  color: AppColors.lightScafoldColor,
                ),
                onPressed: () async {
                  await AppMethods.logoutdialog(
                    context: context,
                    label: 'are you leaving',
                    function: () {
                      // Pop the dialog first
                      Navigator.pop(context);

                      // Delay navigation slightly to ensure the dialog is completely closed
                      Future.delayed(Duration(milliseconds: 100), () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          LoginScreen.routName,
                          (route) => false,
                        );
                      });
                    },
                  );
                },
                label: const SubTitleText(
                  label: 'Log out',
                  color: AppColors.lightScafoldColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
