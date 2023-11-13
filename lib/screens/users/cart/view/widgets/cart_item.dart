import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../models/data_models/cart_model.dart';
import '../../../../../utils/widgets/app_text.dart';
import '../../controller/cart_controller.dart';

class CartItem extends StatelessWidget {
  final CartModel cart;

  const CartItem({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartController>();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      decoration: const BoxDecoration(),
      child: Column(
        children: [
          Row(
            children: [
              CachedNetworkImage(
                imageUrl: cart.image,
                width: 50,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: cart.pname,
                          size: 16,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AppText(
                          text: "Rs. ${cart.price}",
                          size: 14,
                        ),
                      ],
                    ),
                    IconButton(
                      splashRadius: 20,
                      color: Colors.white70,
                      onPressed: () {
                        controller.deleteCartItem(context, cart.cartId);
                      },
                      icon: const Icon(CupertinoIcons.delete),
                    ),
                  ],
                ),
              )
            ],
          ),
          const Divider(
            thickness: 2,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
