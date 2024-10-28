import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_user/Providers/wishlist_provider.dart';

class AddToFavorit extends StatefulWidget {
  const AddToFavorit({super.key, required this.productID});
  final String productID;

  @override
  State<AddToFavorit> createState() => _AddToFavoritState();
}

class _AddToFavoritState extends State<AddToFavorit> {
  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return IconButton(
      onPressed: () {
        wishlistProvider.addOrRemoveWishlist(productID: widget.productID);
      },
      icon: Icon(
        Icons.favorite,
        color: wishlistProvider.isProductInWishlist(productID: widget.productID)
            ? Colors.red
            : Colors.grey,
      ),
    );
  }
}
