import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_user/Providers/theme_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'hello world',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('hello wolrd'),
          ),
          SwitchListTile(
            title:
                Text(themeProvider.getIsDarkTheme ? 'Dark mode' : 'Ligt mode'),
            value: themeProvider.getIsDarkTheme,
            onChanged: (value) {
              themeProvider.setDarkTheme(themeValue: value);
            },
          )
        ],
      ),
    );
  }
}
