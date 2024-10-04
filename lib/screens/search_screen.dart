import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shop_user/constants/assets.dart';
import 'package:shop_user/widgets/title_text.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchTextController;
  @override
  void initState() {
    searchTextController = TextEditingController();
    super.initState();
  }

//  we must use dispose after initestate so will stop it in memory
  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //this widget will enable the user to exit textfield if he press on screen
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const TitleText(
            label: 'Search',
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(Assets.imagesBagShoppingCart),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: searchTextController,
                decoration: InputDecoration(
                  filled: true,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        searchTextController.clear();
                        FocusScope.of(context).unfocus();
                      });
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
                onChanged: (value) {},
                onSubmitted: (value) {
                  log('${searchTextController.text}');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
