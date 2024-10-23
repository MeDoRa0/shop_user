import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_user/Providers/cart_provider.dart';
import 'package:shop_user/screens/cart_screen.dart';
import 'package:shop_user/screens/home.dart';
import 'package:shop_user/screens/profile_screen.dart';
import 'package:shop_user/screens/search_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});
  static const routName = '/RootScreen';

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late PageController screensController;
  int currentScreen = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
  @override
  void initState() {
    super.initState();
    screensController = PageController(initialPage: currentScreen);
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: NavigationBar(
          height: 60,
          selectedIndex: currentScreen,
          destinations: [
            const NavigationDestination(
              selectedIcon: Icon(Icons.house),
              icon: Icon(Icons.house_outlined),
              label: 'Home',
            ),
            const NavigationDestination(
              selectedIcon: Icon(Icons.search),
              icon: Icon(Icons.search_outlined),
              label: 'Search',
            ),
            NavigationDestination(
              selectedIcon: const Icon(Icons.shopping_cart),
              icon: Badge(
                label: Text(cartProvider.getCartItems.length.toString()),
                child: const Icon(Icons.shopping_cart_outlined),
              ),
              label: 'Cart',
            ),
            const NavigationDestination(
              selectedIcon: Icon(Icons.person),
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
          onDestinationSelected: (value) {
            setState(() {
              currentScreen = value;
            });
            screensController.jumpToPage(currentScreen);
          },
        ),
      ),
      body: PageView(
        controller: screensController,
        physics: const NeverScrollableScrollPhysics(),
        children: screens,
      ),
    );
  }
}
