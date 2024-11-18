import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_user/Providers/order_provider.dart';
import 'package:shop_user/constants/assets.dart';
import 'package:shop_user/models/order_model.dart';
import 'package:shop_user/screens/inner_screens/orders/order_widget.dart';
import 'package:shop_user/widgets/empty_screen.dart';
import 'package:shop_user/widgets/empty_screen.dart';
import 'package:shop_user/widgets/title_text.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  static const routName = '/OrderScreen';

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool isEmptyOrder = false;
  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const TitleText(label: 'placed orders'),
      ),
      body: FutureBuilder<List<OrderModel>>(
        future: orderProvider.fetchOrder(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child:
                  SelectableText('an error has been occured ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || orderProvider.getOrders.isEmpty) {
            return EmptyScreen(
                imagePath: Assets.imagesBagOrder,
                title: 'you have no order',
                subtilte: 'go shop and order awesome items',
                buttonText: 'shop now');
          }
          return ListView.separated(
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                child: OrderWidget(
                  orderModel: orderProvider.getOrders[index],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                thickness: 10,
              );
            },
            itemCount: snapshot.data!.length,
          );
        },
      ),
    );
  }
}
