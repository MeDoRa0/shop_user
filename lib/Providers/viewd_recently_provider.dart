import 'package:flutter/material.dart';
import 'package:shop_user/models/viewed_recently_model.dart';
import 'package:uuid/uuid.dart';

class ViewdRecentlyProvider with ChangeNotifier {
  final Map<String, ViewedRecentlyModel> _viewedRecentlyItems = {};
  Map<String, ViewedRecentlyModel> get getviewRecentlytItems {
    return _viewedRecentlyItems;
  }



  void addToViewdRecently({required String productID}) {
    //putIfAbsent is used to add the product to viewed recently if it is not in it
    _viewedRecentlyItems.putIfAbsent(
      productID,
      () => ViewedRecentlyModel(
        id: const Uuid().v4(),
        productID: productID,
      ),
    );

    notifyListeners();
  }
}
