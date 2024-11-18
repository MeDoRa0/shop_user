import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shop_user/Providers/cart_provider.dart';
import 'package:shop_user/Providers/image_provider.dart';
import 'package:shop_user/Providers/order_provider.dart';
import 'package:shop_user/Providers/product_provider.dart';
import 'package:shop_user/Providers/theme_provider.dart';
import 'package:shop_user/Providers/user_provider.dart';
import 'package:shop_user/Providers/viewd_recently_provider.dart';
import 'package:shop_user/Providers/wishlist_provider.dart';
import 'package:shop_user/constants/theme_data.dart';
import 'package:shop_user/root_screen.dart';
import 'package:shop_user/screens/auth/forogot_password_screen.dart';
import 'package:shop_user/screens/auth/login.dart';
import 'package:shop_user/screens/auth/signup.dart';
import 'package:shop_user/screens/home.dart';
import 'package:shop_user/screens/inner_screens/orders/order_screen.dart';
import 'package:shop_user/screens/inner_screens/product_details.dart';
import 'package:shop_user/screens/search_screen.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
          future: Firebase.initializeApp(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(
                body: Center(child: CircularProgressIndicator(),),
              );
            } else if (snapshot.hasError) {
              return Scaffold(
                body: Center(
                  child: SelectableText(
                      'an error has been occured ${snapshot.error}'),
                ),
              );
            }
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => ThemeProvider(),
                ),
                ChangeNotifierProvider(
                  create: (context) => ProductProvider(),
                ),
                ChangeNotifierProvider(
                  create: (context) => ImageProviderModel(),
                ),
                ChangeNotifierProvider(
                  create: (context) => CartProvider(),
                ),
                ChangeNotifierProvider(
                  create: (context) => WishlistProvider(),
                ),
                ChangeNotifierProvider(
                  create: (context) => ViewdRecentlyProvider(),
                ),
                ChangeNotifierProvider(
                  create: (context) => UserProvider(),
                ),
                ChangeNotifierProvider(
                  create: (context) => OrderProvider(),
                ),
              ],
              //we can use Consumer to use ThemePovider
              child: Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: Styles.themeData(
                        isDarkTheme: themeProvider.getIsDarkTheme,
                        context: context),
                    title: 'shop user',
                    home: const RootScreen(),
                    // home: const SignupScreen(),
                    routes: {
                      ProductDetails.routName: (context) =>
                          const ProductDetails(),
                      WishList.routName: (context) => const WishList(),
                      ViewedRecently.routName: (context) =>
                          const ViewedRecently(),
                      HomeScreen.routName: (context) => const HomeScreen(),
                      RootScreen.routName: (context) => const RootScreen(),
                      SignupScreen.routName: (context) => const SignupScreen(),
                      LoginScreen.routName: (context) => const LoginScreen(),
                      OrderScreen.routName: (context) => const OrderScreen(),
                      ForogotPasswordScreen.routName: (context) =>
                          const ForogotPasswordScreen(),
                      SearchScreen.routeName: (context) => const SearchScreen(),
                    },
                  );
                },
              ),
            );
          }),
    );
  }
}
