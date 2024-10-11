import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
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
    return TextField(
      controller: searchTextController,
      decoration: InputDecoration(
        filled: true,
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          onPressed: () {
            // setState(() {
            searchTextController.clear();
            FocusScope.of(context).unfocus();
            //});
          },
          icon: const Icon(Icons.clear),
        ),
      ),
      onChanged: (value) {},
      onSubmitted: (value) {},
    );
  }
}
