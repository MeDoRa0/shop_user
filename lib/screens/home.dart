import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_user/Providers/theme_provider.dart';
import 'package:shop_user/widgets/subtitle_text.dart';
import 'package:shop_user/widgets/title_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TitleText(label: 'this is title '),
          const subTitleText(
            label: 'hello world',
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
