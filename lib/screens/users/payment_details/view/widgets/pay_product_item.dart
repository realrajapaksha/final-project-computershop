import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../models/data_models/pay_product_model.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/widgets/app_text.dart';

class PayProductItem extends StatelessWidget {
  final PayProductModel product;

  const PayProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.deepBlue),
      ),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Hero(
                tag: product.image,
                child: CachedNetworkImage(
                  imageUrl: product.image,
                  width: 50,
                  height: 50,
                ),
              )),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: product.pname,
                    fontColor: Colors.black,
                    size: 14,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  AppText(
                    text: "Rs ${product.price}0",
                    fontColor: Colors.black,
                  ),
                ],
              )),
          Expanded(
              flex: 1,
              child: AppText(
                text: "Unit : ${product.qty}",
                fontColor: Colors.black,
              )),
        ],
      ),
    );
  }
}
