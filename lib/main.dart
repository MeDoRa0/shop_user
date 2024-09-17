import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_user/Providers/theme_provider.dart';
import 'package:shop_user/constants/theme_data.dart';
import 'package:shop_user/screens/home.dart';

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
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          theme: Styles.themeData(
              isDarkTheme: themeProvider.getIsDarkTheme, context: context),
          title: 'shop user',
          home: HomeScreen(),
        );
      }),
    );
  }
}
