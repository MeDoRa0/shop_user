import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shop_user/widgets/subtitle_text.dart';

class QuantityBottomSheet extends StatelessWidget {
  const QuantityBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Container(
          height: 6,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.grey),
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  log('index $index');
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: SubTitleText(label: '${index + 1}'),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
