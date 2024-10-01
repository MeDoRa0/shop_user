import 'package:flutter/material.dart';
import 'package:shop_user/widgets/subtitle_text.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.function,
  });
  final String icon;
  final String title;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        function();
      },
      leading: Image.asset(
        icon,
        height: 40,
      ),
      title: SubTitleText(label: title),
      trailing: const Icon(Icons.arrow_right),
    );
  }
}
