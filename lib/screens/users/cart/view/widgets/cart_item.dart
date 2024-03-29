import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../models/data_models/cart_model.dart';
import '../../../../../models/navigate_models/product_nav_model.dart';
import '../../../../../routes/app_route.dart';
import '../../../../../utils/widgets/app_text.dart';
import '../../controller/cart_controller.dart';

class CartItem extends StatelessWidget {
  final CartModel cart;

  const CartItem({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartController>();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      decoration: const BoxDecoration(),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              final model =
                  ProductNavModel(productId: cart.productId, image: cart.image);
              Navigator.pushNamed(context, AppRoute.productDetails,
                  arguments: model);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: cart.image,
                      width: 50,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
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
                              text: "Rs. ${cart.price}.00",
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
            ),
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
