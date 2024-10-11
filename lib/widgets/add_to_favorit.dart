import 'package:flutter/material.dart';

class AddToFavorit extends StatefulWidget {
  const AddToFavorit({super.key});

  @override
  State<AddToFavorit> createState() => _AddToFavoritState();
}

class _AddToFavoritState extends State<AddToFavorit> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.favorite,
      ),
    );
  }
}
