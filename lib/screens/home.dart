import 'package:flutter/material.dart';
import 'package:shop_user/constants/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightScafoldColor,
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
            title: Text('dark mode'),
            value: false,
            onChanged: (value) {},
          )
        ],
      ),
    );
  }
}
