import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_user/Providers/image_provider.dart';

class PickImage extends StatelessWidget {
  const PickImage({super.key, required this.function});

  final Function function;

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImageProviderModel>(context);
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: imageProvider.pickedImage == null
                ? Container(
                    //height: size.height * 0.2,
                    //   width: size.width * 5,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  )
                : Image.file(
                    File(
                      imageProvider.pickedImage!.path,
                    ),
                    fit: BoxFit.fill,
                  ),
          ),
        ),
        Positioned(
            top: 0,
            right: 0,
            child: Material(
              borderRadius: BorderRadius.circular(16),
              color: Colors.orange,
              child: InkWell(
                splashColor: Colors.orange.shade200,
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  function();
                },
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.add_a_photo,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
