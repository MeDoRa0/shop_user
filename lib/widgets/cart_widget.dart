import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FancyShimmerImage(
            imageUrl:
                'https://th.bing.com/th/id/R.77eed415b01a3ec4f6cb7758a5a2a6d4?rik=XKDGn49n844u4Q&riu=http%3a%2f%2fpluspng.com%2fimg-png%2fshoes-png-nike-shoes-transparent-background-800.png&ehk=ZvKLgGJIAl%2fJYtcu4emEZimity8VBQnk3UNcaW8MbLQ%3d&risl=&pid=ImgRaw&r=0')
      ],
    );
  }
}
