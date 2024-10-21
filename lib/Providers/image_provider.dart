import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageProviderModel with ChangeNotifier {
  XFile? _pickedImage;

  XFile? get pickedImage => _pickedImage;

  void setPickedImage(XFile? image) {
    _pickedImage = image;
    notifyListeners();
  }

  void clearImage() {
    _pickedImage = null;
    notifyListeners();
  }
}
