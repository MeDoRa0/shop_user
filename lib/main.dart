import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_user/Providers/theme_provider.dart';
import 'package:shop_user/constants/theme_data.dart';
import 'package:shop_user/root_screen.dart';
import 'package:shop_user/screens/auth/login.dart';
import 'package:shop_user/screens/auth/signup.dart';
import 'package:shop_user/screens/home.dart';
import 'package:shop_user/screens/inner_screens/product_details.dart';
import 'package:shop_user/screens/viewed_recently.dart';
import 'package:shop_user/screens/wishlist.dart';

void main() {
  runApp(const ShopUser());
}

class ShopUser extends StatelessWidget {
  const ShopUser({super.key});

  @override
  Widget build(BuildContext context) {
    //final themeProvider = Provider.of<ThemeProvider>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        )
      ],
      //we can use Consumer to use ThemePovider
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            theme: Styles.themeData(
                isDarkTheme: themeProvider.getIsDarkTheme, context: context),
            title: 'shop user',
            // home: const RootScreen(),
            home: const SignupScreen(),
            routes: {
              ProductDetails.routName: (context) => const ProductDetails(),
              WishList.routName: (context) => const WishList(),
              ViewedRecently.routName: (context) => const ViewedRecently(),
              HomeScreen.routName: (context) => const HomeScreen(),
              RootScreen.routName: (context) => const RootScreen(),
            },
          );
        },
      ),
    );
  }
}
