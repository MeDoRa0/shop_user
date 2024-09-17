import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
            value: false,
            onChanged: (value) {},
          )
        ],
      ),
    );
  }
}
