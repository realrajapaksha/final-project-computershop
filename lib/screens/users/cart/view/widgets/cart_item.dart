import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/widgets/app_text.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      decoration: const BoxDecoration(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: "item one",
                    size: 15,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  AppText(text: "Rs 451000.00"),
                ],
              ),
              Row(
                children: [
                  const AppText(text: "Units: 1"),
                  const SizedBox(
                    height: 15,
                  ),
                  IconButton(
                    splashRadius: 20,
                    color: Colors.white70,
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.delete),
                  )
                ],
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
