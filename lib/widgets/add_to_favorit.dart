import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_user/Providers/wishlist_provider.dart';
import 'package:shop_user/services/app_methods.dart';

class AddToFavorit extends StatefulWidget {
  const AddToFavorit({super.key, required this.productID});
  final String productID;

  @override
  State<AddToFavorit> createState() => _AddToFavoritState();
}

class _AddToFavoritState extends State<AddToFavorit> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return IconButton(
      onPressed: () async {
        // wishlistProvider.addOrRemoveWishlist(productID: widget.productID);
        setState(() {
          isLoading = true;
        });
        try {
          if (wishlistProvider.getWishlistItems.containsKey(widget.productID)) {
            wishlistProvider.removeItemFromWishlistFirebase(
                wishlistId:
                    wishlistProvider.getWishlistItems[widget.productID]!.id,
                productID: widget.productID);
          } else {
            wishlistProvider.addToWishlistFirebase(
                productID: widget.productID, context: context);
          }
          await wishlistProvider.fetchWishlistFirebase();
        } catch (error) {
          AppMethods.errorDialog(
            context: context,
            label: error.toString(),
            function: () {},
          );
        } finally {
          setState(() {
            isLoading = false;
          });
        }
      },
      icon:isLoading? CircularProgressIndicator(): Icon(
        Icons.favorite,
        color: wishlistProvider.isProductInWishlist(productID: widget.productID)
            ? Colors.red
            : Colors.grey,
      ),
    );
  }
}
