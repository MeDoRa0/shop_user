import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shop_user/Providers/cart_provider.dart';
import 'package:shop_user/Providers/product_provider.dart';
import 'package:shop_user/Providers/user_provider.dart';
import 'package:shop_user/constants/assets.dart';
import 'package:shop_user/services/app_methods.dart';
import 'package:shop_user/widgets/bottom_checkout.dart';
import 'package:shop_user/widgets/cart_widget.dart';
import 'package:shop_user/widgets/empty_screen.dart';
import 'package:shop_user/widgets/loading_manager.dart';
import 'package:shop_user/widgets/title_text.dart';
import 'package:uuid/uuid.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
//final bool isEmpty = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    return cartProvider.getCartItems.isEmpty
        ? const Scaffold(
            body: EmptyScreen(
              imagePath: Assets.imagesBagShoppingCart,
              title: 'your cart is empty',
              subtilte:
                  'Looks like you did not add item yet, \n go ahead and shop now',
              buttonText: 'shop now',
            ),
          )
        : Scaffold(
            bottomSheet: BottomCheckout(function: () async {
              await placeOrder(
                cartProvider: cartProvider,
                productProvider: productProvider,
                userProvider: userProvider,
              );
            }),
            appBar: AppBar(
              title: const TitleText(label: 'Cart'),
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(Assets.imagesBagShoppingCart),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      AppMethods.optionalAlertDialog(
                          context: context,
                          label: 'clear your cart',
                          function: () async {
                            await cartProvider.clearCartFirebase();
                            Fluttertoast.showToast(
                                msg: 'all items removed from your cart',
                                backgroundColor: Colors.red);
                          });
                    },
                    icon: const Icon(Icons.delete))
              ],
            ),
            body: LoadingManager(
              isLoading: isLoading,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartProvider.getCartItems.length,
                      itemBuilder: (context, index) {
                        return ChangeNotifierProvider.value(
                          value: cartProvider.getCartItems.values
                              .toList()
                              .reversed
                              .toList()[index],
                          child: const CartWidget(),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: kBottomNavigationBarHeight + 10,
                  )
                ],
              ),
            ),
          );
  }

  Future<void> placeOrder({
    required CartProvider cartProvider,
    required ProductProvider productProvider,
    required UserProvider userProvider,
  }) async {
    final auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user == null) {
      return;
    }
    final uid = user.uid;
    try {
      setState(() {
        isLoading = true;
      });
      cartProvider.getCartItems.forEach((key, value) async {
        final getCurrentProduct = productProvider.findByProdId(value.productID);
        final orderId = Uuid().v4();
        await FirebaseFirestore.instance
            .collection('ordersAdvanced')
            .doc(orderId)
            .set({
          'orderId': orderId,
          'userId': uid,
          'productId': value.productID,
          'productTitle': getCurrentProduct!.productTitle,
          'userName': userProvider.getUserModel!.userName,
          'price': getCurrentProduct.productPrice * value.quantity,
          'imageUrl': getCurrentProduct.productImage,
          'quantity': value.quantity,
          'orderDate': Timestamp.now(),
          'totalPrice': cartProvider.getTotal(productProvider: productProvider),
        });
      });
      Fluttertoast.showToast(
        msg: 'your orders has been placed',
        backgroundColor: Colors.blueGrey,
      );
      await cartProvider.clearCartFirebase();
      cartProvider.clearLocalCart();
    } catch (error) {
      AppMethods.errorDialog(
        context: context,
        label: error.toString(),
        function: () {},
      );
    } finally {
      setState(
        () {
          isLoading = false;
        },
      );
    }
  }
}
