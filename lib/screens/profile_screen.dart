import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_user/Providers/theme_provider.dart';
import 'package:shop_user/Providers/user_provider.dart';
import 'package:shop_user/constants/app_colors.dart';
import 'package:shop_user/constants/assets.dart';
import 'package:shop_user/models/user_model.dart';
import 'package:shop_user/screens/auth/login.dart';
import 'package:shop_user/screens/sections/general_sections.dart';
import 'package:shop_user/services/app_methods.dart';
import 'package:shop_user/widgets/app_name_text.dart';
import 'package:shop_user/widgets/loading_manager.dart';
import 'package:shop_user/widgets/subtitle_text.dart';
import 'package:shop_user/widgets/title_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  bool _isLoading = true;
  UserModel? userModel;

  Future<void> fetchUserInfo() async {
    if (user == null) {
      setState(() {
        _isLoading = false;
      });
      return;
    }
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      userModel = await userProvider.fetchUserInfo();
    } catch (error) {
      await AppMethods.errorDialog(
        context: context,
        label: 'an error has been occured $error',
        function: () {},
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    fetchUserInfo();
    super.initState();
  }

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
      body: LoadingManager(
        isLoading: _isLoading,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: user == null ? true : false,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child:
                      TitleText(label: 'Please login to have ultimate access'),
                ),
              ),
              userModel == null
                  ? SizedBox.shrink()
                  : Padding(
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
                              image: DecorationImage(
                                image: NetworkImage(
                                  userModel!.userImage,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleText(label: userModel!.userName),
                              SubTitleText(label: userModel!.userEmail),
                            ],
                          ),
                        ],
                      ),
                    ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    user == null ? SizedBox.shrink() : const GeneralSection(),
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
                    backgroundColor: user == null ? Colors.green : Colors.red,
                  ),
                  icon: Icon(
                    user == null ? Icons.login : Icons.logout,
                    color: AppColors.lightScafoldColor,
                  ),
                  onPressed: () async {
                    if (user == null) {
                      await Navigator.pushNamed(context, LoginScreen.routName);
                    } else {
                      await AppMethods.logoutdialog(
                          context: context,
                          label: 'are you leaving',
                          function: () async {
                            await FirebaseAuth.instance.signOut();
                            if (!mounted) return;
                            await Navigator.pushNamed(
                                context, LoginScreen.routName);
                          });
                    }
                  },
                  label: SubTitleText(
                    label: user == null ? 'Login' : 'Logout',
                    color: AppColors.lightScafoldColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
