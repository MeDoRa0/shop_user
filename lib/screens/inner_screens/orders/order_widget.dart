import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_user/Providers/order_provider.dart';
import 'package:shop_user/models/order_model.dart';
import 'package:shop_user/services/app_methods.dart';
import 'package:shop_user/widgets/subtitle_text.dart';
import 'package:shop_user/widgets/title_text.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({super.key, required this.orderModel});

  final OrderModel orderModel;

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);

    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FancyShimmerImage(
                height: size.height * 0.20,
                width: size.width * 0.30,
                imageUrl: widget.orderModel.imageUrl),
          ),
          SizedBox(
            width: 16,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: TitleText(
                          label: widget.orderModel.productTitle,
                          maxLines: 2,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          AppMethods.optionalAlertDialog(
                              context: context,
                              label: 'cancel this order',
                              function: () async {
                                await orderProvider.removeOrderFireBase(
                                    widget.orderModel.orderId);
                              });
                        },
                        icon: const Icon(Icons.clear),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TitleText(
                        label: 'price:  ',
                        fontSize: 15,
                      ),
                      Flexible(
                        child: SubTitleText(
                          label: widget.orderModel.price.toString(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: TitleText(
                          label: 'Qty:  ',
                          fontSize: 16,
                        ),
                      ),
                      Flexible(
                        child: SubTitleText(
                          label: widget.orderModel.quantity.toString(),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
